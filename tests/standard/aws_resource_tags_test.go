// Copyright 2023-2024, Northwood Labs
// Copyright 2023-2024, Ryan Parman <rparman@northwood-labs.com>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package test

import (
	"fmt"
	"os"
	"runtime"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/hairyhenderson/go-which"
	"github.com/stretchr/testify/assert"
)

const (
	errTerraformPath     = "failed to set TF_ACC_TERRAFORM_PATH"
	errProviderNamespace = "failed to set TF_ACC_PROVIDER_NAMESPACE"
	errProviderHost      = "failed to set TF_ACC_PROVIDER_HOST"
)

var (
	err error

	tmpDir        = "./"
	origPath      = os.Getenv("TF_ACC_TERRAFORM_PATH")
	origNamespace = os.Getenv("TF_ACC_PROVIDER_NAMESPACE")
	origHostname  = os.Getenv("TF_ACC_PROVIDER_HOST")

	// Both must be installed first.
	binaries = []string{
		"terraform",
		"tofu",
	}
)

func TestAwsResourceTags(t *testing.T) {
	// https://golang.org/pkg/testing/#T.Parallel
	t.Parallel()

	for i := range binaries {
		binary := binaries[i]

		if _, err = os.Stat(which.Which(binary)); os.IsNotExist(err) {
			t.Fatalf("Binary %s must be installed first", binary)
		}

		// https://pkg.go.dev/github.com/gruntwork-io/terratest/modules/terraform#Options
		terraformOptions := &terraform.Options{
			// The path to Terraform.
			TerraformBinary: which.Which(binary),

			// The path to where our Terraform code is located
			TerraformDir: tmpDir,

			// Disable colors in Terraform commands so its easier to parse stdout/stderr
			NoColor: true,

			// terraform init -upgrade
			Upgrade: true,

			// terraform init -reconfigure
			Reconfigure: true,

			// Set the maximum number of parallelism; equivalent to `nproc`.
			Parallelism: runtime.NumCPU(),
		}

		defer test_structure.RunTestStage(t, "destroy", func() {
			terraformOptions := test_structure.LoadTerraformOptions(t, tmpDir)
			terraform.Destroy(t, terraformOptions)
		})

		test_structure.RunTestStage(t, "tfapply", func() {
			terraform.InitAndApply(t, terraformOptions)
			test_structure.SaveTerraformOptions(t, tmpDir, terraformOptions)
		})

		test_structure.RunTestStage(t, "outputs", func() {
			terraformOptions := test_structure.LoadTerraformOptions(t, tmpDir)
			instanceTags := terraform.OutputMap(t, terraformOptions, "common_tags")
			randomId := terraform.Output(t, terraformOptions, "random_id")

			expectedTags := map[string]string{
				"app":        fmt.Sprintf("sample-app-%s", randomId),
				"env":        "sandbox",
				"managed_by": "opentofu",
			}

			for tag, expectedValue := range expectedTags {
				actualValue, doesContain := instanceTags[tag]
				assert.True(t, doesContain)
				assert.Equal(t, expectedValue, actualValue)
			}
		})
	}
}
