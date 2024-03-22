terraform {
  required_version = ">= 1.6, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Generate a random value based on the timestamp
resource "random_id" "timestamp" {
  byte_length = 8
  keepers = {
    ts = timestamp()
  }
}

module "aws_resource_tags" {
  source = "../../" # https://github.com/northwood-labs/aws-resource-tags.git?ref={tag}

  app = "sample-app-${random_id.timestamp.hex}"
  env = "sandbox"

  additional_tags = {
    managed_by = "opentofu"
  }
}

/** EXAMPLE-ABOVE */
#-------------------------------------------------------------------------------

# tflint-ignore: terraform_documented_outputs
output "common_tags" {
  value = module.aws_resource_tags.common_tags
}

output "random_id" {
  value = random_id.timestamp.hex
}
