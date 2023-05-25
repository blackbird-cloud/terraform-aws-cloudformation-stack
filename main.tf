resource "aws_cloudformation_stack" "default" {
  name = var.name
  tags = var.tags

  template_url  = var.template_url
  template_body = var.template_body

  policy_body = var.policy_body
  policy_url  = var.policy_url

  parameters   = var.parameters
  capabilities = var.capabilities

  iam_role_arn      = var.iam_role_arn
  notification_arns = var.notification_arns
  disable_rollback  = var.disable_rollback

  on_failure         = var.on_failure
  timeout_in_minutes = var.timeout_in_minutes
}
