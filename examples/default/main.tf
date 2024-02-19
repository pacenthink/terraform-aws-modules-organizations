terraform {
  backend "s3" {
    bucket = "aws-shared-terraform-state"
    key    = "aws/usw2/modules/aws-organization/default"
    region = "us-east-1"
  }
}

module "aws_organizations_account" {
  source        = "../../"
  account_name  = "examples-default"
  account_email = "examples-default@nurdsoft.co"
}

output "new_account_arn" {
  value = module.aws_organizations_account.account_arn
}

output "new_account_id" {
  value = module.aws_organizations_account.account_id
}
