terraform {
  backend "s3" {
    bucket = "aws-shared-terraform-state"
    key    = "aws/usw2/modules/aws-organization"
    region = "us-east-1"
  }
}

module "aws_organizations_account" {
  source            = "github.com/pacenthink/terraform-aws-modules-organizations.git?ref=feat%2FRAD-1286"
  account_name      = "examples-close-on-delete"
  account_email     = "devops@nurdsoft.co"
  close_on_deletion = "true"
}

output "new_account_arn" {
  value = module.aws_organizations_account.account_arn
}

output "new_account_id" {
  value = module.aws_organizations_account.account_id
}
