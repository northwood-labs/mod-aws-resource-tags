locals {
  tag_app = lower(var.app)
  tag_env = lower(var.env)

  std_tags = {
    app         = local.tag_app
    env         = local.tag_env
    region      = data.aws_region.current.name
    deployed_at = timestamp()
    deployed_by = data.aws_caller_identity.current.arn
  }

  common_tags   = merge(local.std_tags, var.extra)
  resource_name = "${local.tag_app}-${local.tag_env}"

  launch_template_resource_tags = merge(local.common_tags, {
    "Name" = local.resource_name
  })
}
