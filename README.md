<!--
<div align="center"><img src="tf-modules-stable.png" alt="Terraform Modules: Stable" width="500"><br></div>

---
-->

# AWS Resource Tags Module

[![Terraform](https://img.shields.io/badge/Terraform-623ce4.svg?labelColor=171e21&style=for-the-badge&logo=terraform)][terraform] [![OpenTofu](https://img.shields.io/badge/OpenTofu-ffda18.svg?labelColor=171e21&style=for-the-badge&logo=opentofu)][opentofu] [![Golang](https://img.shields.io/badge/Go-00add8.svg?labelColor=171e21&style=for-the-badge&logo=go)][golang] [![Node.js](https://img.shields.io/badge/Node.js-339933.svg?labelColor=171e21&style=for-the-badge&logo=node.js)][node.js]

Simplifies the process of applying the correct AWS tags to Northwood Labs resources.

| Information            | Description   |
|------------------------|---------------|
| **Terraform Versions** | 1.6, 1.7, 1.8 |
| **OpenTofu Versions**  | 1.6, 1.7      |

## Features

* Designed to be highly _composable_, and has no hard-dependencies on other modules.

## Examples

More examples can be found in the `./examples` directory.

```hcl
# Load the module
module "aws_resource_tags" {
  source = "https://github.com/northwood-labs/aws-resource-tags.git?ref={tag}"

  app = "sample-app"
  env = "sandbox"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| `terraform` | ~> 1.6 |
| `aws` | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
<pre>&{Name:aws Alias: Version:~> 5.0 Position:{Filename:whoami.tf Line:2}}</pre>

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | The `app` tag. Lowercase and hyphenated. | `string` | n/a | yes |
| env | The `env` tag. Lowercase. | `string` | n/a | yes |
| additional_tags | Additional tags in the map format: `{key = value}`. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| app | The value of the `app` input variable. |
| common_tags | Most services support simple `key = value` pairs. |
| deployed_at | The RFC 3339 at which the resources were deployed. |
| deployed_by | The ARN of the assumed role which performed the deployment. |
| env | The value of the `env` input variable. |
| launch_template_resource_tags | Tags formatted for use with _Launch Templates_. |
| region | The AWS region in which the resources are being created. |

## Resources

* [`data.aws_caller_identity`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)
* [`data.aws_region`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)
<!-- END_TF_DOCS --> Check:false BeginComment:<!-- BEGIN_TF_DOCS --> EndComment:<!-- END_TF_DOCS -->} OutputValues:{Enabled:false From:} Sort:{Enabled:true By:required} Settings:{Anchor:false Color:true Default:true Description:false Escape:false HideEmpty:false HTML:false Indent:2 LockFile:false ReadComments:false Required:true Sensitive:true Type:true} ModuleRoot:.}</pre>

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.6 |
| aws | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app | The `app` tag. Lowercase and hyphenated. | `string` | n/a | yes |
| env | The `env` tag. Lowercase. | `string` | n/a | yes |
| additional_tags | Additional tags in the map format: `{key = value}`. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| app | The value of the `app` input variable. |
| common_tags | Most services support simple `key = value` pairs. |
| deployed_at | The RFC 3339 at which the resources were deployed. |
| deployed_by | The ARN of the assumed role which performed the deployment. |
| env | The value of the `env` input variable. |
| launch_template_resource_tags | Tags formatted for use with _Launch Templates_. |
| region | The AWS region in which the resources are being created. |

## Resources

* [`data.aws_caller_identity`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)
* [`data.aws_region`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)
<!-- END_TF_DOCS -->

## Testing

For integration tests, we use the [Terratest](https://github.com/gruntwork-io/terratest) testing framework. All of the building and testing dependencies are bundled-up as a Docker image, so see [northwood-labs/dev-env](https://github.com/northwood-labs/dev-env) before running these tests.

These tests create _real resources_, which cost _real money_.

```bash
make test
```

[golang]: https://go.dev
[node.js]: https://nodejs.org
[opentofu]: https://opentofu.org
[terraform]: https://terraform.io
