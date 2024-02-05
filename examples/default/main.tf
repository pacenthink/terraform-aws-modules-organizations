module "aws_organizations_account" {
  source        = "../../"
  account_name  = "aws-nurdsoft-demo"
  account_email = "devops@nurdsoft.co"
}

output "new_account_arn" {
  value = module.aws_organizations_account.account_arn
}

output "new_account_id" {
  value = module.aws_organizations_account.account_id
}
