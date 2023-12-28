module aws_organizations_account {
  source = "./terraform-aws-organizations/"
  account_name = "aws-nurdsoft-demo"
  account_email = "devops@nurdsoft.co"
  close_on_deletion = "true"
}