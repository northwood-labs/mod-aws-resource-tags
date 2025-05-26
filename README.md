<div align="center"><img src="https://github.com/northwood-labs/mod-template/raw/main/tofu-modules-lightmode.png#gh-light-mode-only" alt="Seal of Approval" width="500"><img src="https://github.com/northwood-labs/mod-template/raw/main/tofu-modules-darkmode.png#gh-dark-mode-only" alt="Seal of Approval" width="500"><br></div>

---

# AWS Resource Tags Module

[![AWS](https://img.shields.io/badge/AWS-232f3e.svg?logoColor=ffffff&style=for-the-badge&logo=amazonaws)][aws]
[![Terraform](https://img.shields.io/badge/Terraform-623ce4.svg?logoColor=ffffff&style=for-the-badge&logo=terraform)][terraform]
[![OpenTofu](https://img.shields.io/badge/OpenTofu-ffda18.svg?logoColor=171e21&style=for-the-badge&logo=opentofu)][opentofu]
[![Golang](https://img.shields.io/badge/Go-00add8.svg?logoColor=ffffff&style=for-the-badge&logo=go)][golang]
[![Node.js](https://img.shields.io/badge/Node.js-339933.svg?logoColor=ffffff&style=for-the-badge&logo=node.js)][node.js]

Simplifies the process of applying the correct AWS tags to Northwood Labs resources.

| Information            | Description                    |
|------------------------|--------------------------------|
| **Terraform Versions** | 1.6, 1.7, 1.8, 1.9, 1.10, 1.11 |
| **OpenTofu Versions**  | 1.6, 1.7, 1.8, 1.9             |

## Features

* Designed to be highly _composable_, and has no hard-dependencies on other modules.

* Integration tests run automatically on every commit against supported versions of Terraform/OpenTofu.

* Outputs can be easily used with other modules or resources which support tagging.

* Adds tag data about the ARN of the user who performed the deployment, as well as a timestamp of the deployment.

* Only looks-up data, but does not persist any data itself, making it completely stateless.

* Purpose-built, meaning that it is designed to solve a single orthogonal problem. Aims to fit 90% of use-cases.

## Examples

More examples can be found in the `./examples` directory.

```hcl
# Load the module
module "aws_resource_tags" {
  source = "https://github.com/northwood-labs/mod-aws-resource-tags.git?ref={tag}"

  app = "sample-app"
  env = "sandbox"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name        | Provider                                                                           | Version   |
|-------------|------------------------------------------------------------------------------------|-----------|
| `terraform` |                                                                                    | `~> 1.6`  |
| `aws`       | [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | `~> 5.42` |

## Inputs

|        Req         | Variable          | Type                                                              | Description                                                                                                                                                            | Default |
|:------------------:|-------------------|-------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| :white_check_mark: | `app`             | [`string`](https://opentofu.org/docs/language/expressions/types/) | The `app` tag. Lowercase and hyphenated.                                                                                                                               |         |
| :white_check_mark: | `env`             | [`string`](https://opentofu.org/docs/language/expressions/types/) | The `env` tag. Lowercase.                                                                                                                                              |         |
|                    | `extra`           | [`map`](https://opentofu.org/docs/language/expressions/types/)    | Additional (ad hoc) tags to apply.                                                                                                                                     | `{}`    |
|                    | `is_foundational` | [`bool`](https://opentofu.org/docs/language/expressions/types/)   | Whether or not this is a foundational piece of infrastructure. A value of `true` will add the `foundational` and `cloud-nuke-after` tags. A value of `false` will not. | `false` |

## Outputs

| Name                            | Description                                                                                         |
|---------------------------------|-----------------------------------------------------------------------------------------------------|
| `app`                           | The value of the `app` input variable.                                                              |
| `common_tags`                   | Most services support simple `key = value` pairs.                                                   |
| `deployed_at`                   | The [RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339) at which the resources were deployed. |
| `deployed_by`                   | The ARN of the assumed role which performed the deployment.                                         |
| `env`                           | The value of the `env` input variable.                                                              |
| `launch_template_resource_tags` | Tags formatted for use with _Launch Templates_.                                                     |
| `region`                        | The AWS region in which the resources are being created.                                            |

## Resources

| Kind        | Source                                                                                                                       | Name      | Provider                                                                           |
|-------------|------------------------------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------|
| data source | [`data.aws_caller_identity`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | `current` | [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) |
| data source | [`data.aws_region`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)                   | `current` | [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) |
<!-- END_TF_DOCS -->

## Testing

For integration tests, we use the [Terratest](https://github.com/gruntwork-io/terratest) testing framework. All of the building and testing dependencies are bundled-up as a Docker image, so see [northwood-labs/dev-env](https://github.com/northwood-labs/dev-env) before running these tests.

These tests create _real resources_, which cost _real money_.

```bash
make test
```

[aws]: https://aws.amazon.com
[golang]: https://go.dev
[node.js]: https://nodejs.org
[opentofu]: https://opentofu.org
[terraform]: https://developer.hashicorp.com/terraform
