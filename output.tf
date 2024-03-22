output "common_tags" {
  description = "Most services support simple `key = value` pairs."
  value       = local.common_tags
}

output "launch_template_resource_tags" {
  description = "Tags formatted for use with _Launch Templates_."
  value       = local.launch_template_resource_tags
}

output "app" {
  description = "The value of the `app` input variable."
  value       = local.std_tags["app"]
}

output "env" {
  description = "The value of the `env` input variable."
  value       = local.std_tags["env"]
}

output "region" {
  description = "The AWS region in which the resources are being created."
  value       = local.std_tags["region"]
}

output "deployed_at" {
  description = "The [RFC 3339](https://datatracker.ietf.org/doc/html/rfc3339) at which the resources were deployed."
  value       = local.std_tags["deployed_at"]
}

output "deployed_by" {
  description = "The ARN of the assumed role which performed the deployment."
  value       = local.std_tags["deployed_by"]
}
