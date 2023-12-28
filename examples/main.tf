module aws_organizations_account {
  source = "./terraform-aws-organizations/"
  account_name = "test01"
  account_email = "982349823492834@982349823492834.com"
  close_on_deletion = "true"
}