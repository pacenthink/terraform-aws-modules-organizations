resource "aws_organizations_account" "account" {
  name  = var.account_name
  email = var.account_email
  close_on_deletion = var.close_on_deletion
}
