module "aws_organizations_account" {
  source            = "github.com/pacenthink/terraform-aws-modules-organizations.git?ref=feat%2FRAD-1286"
  account_name      = "aws-nurdsoft-demo"
  account_email     = "devops@nurdsoft.co"
  close_on_deletion = "true"
}

output "new_account_arn" {
  value = module.aws_organizations_account.account_arn
}

output "new_account_id" {
  value = module.aws_organizations_account.account_id
}
