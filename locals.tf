locals {
  # Holy frick, lowercase your tags.
  tag_app = lower(var.app)
  tag_env = lower(var.env)

  # Standard values.
  std_tags = {
    app         = local.tag_app
    env         = local.tag_env
    region      = data.aws_region.current.name
    deployed_at = timestamp()
    deployed_by = data.aws_caller_identity.current.arn
  }

  # Custom values.
  std_tags_processed = var.is_foundational ? merge(local.std_tags, {
    foundational     = true
    cloud-nuke-after = true
  }) : local.std_tags

  # Merge the standard/custom tags with the extra tags.
  common_tags   = merge(local.std_tags_processed, var.extra)
  resource_name = "${local.tag_app}-${local.tag_env}"

  # Special case for the `aws_launch_template` resource.
  launch_template_resource_tags = merge({
    "Name" = local.resource_name
  }, local.common_tags)
}
