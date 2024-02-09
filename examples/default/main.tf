module "aws_organizations_account" {
  source        = "github.com/pacenthink/terraform-aws-modules-organizations.git?ref=feat%2FRAD-1286"
  account_name  = "examples-default"
  account_email = "examples-default@nurdsoft.co"
}

output "new_account_arn" {
  value = module.aws_organizations_account.account_arn
}

output "new_account_id" {
  value = module.aws_organizations_account.account_id
}
