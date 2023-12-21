output "account_arn" {
  description = "ARN of the new AWS org account"
  value       = aws_organizations_account.account.arn
}
output "account_id" {
  description = "The AWS account ID"
  value       = aws_organizations_account.account.id
}