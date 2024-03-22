# https://opentofu.org/docs/language/settings/
terraform {
  required_version = "~> 1.6"

  required_providers {
    # https://github.com/hashicorp/terraform-provider-aws/releases/latest
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
