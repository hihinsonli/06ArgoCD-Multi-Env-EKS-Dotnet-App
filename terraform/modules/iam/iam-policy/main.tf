resource "aws_iam_policy" "this" {
  description = var.description
  name        = var.name_prefix != null ? null : var.name
  name_prefix = var.name_prefix

  path   = var.path
  policy = var.policy
  tags   = var.tags
}
