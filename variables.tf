#-------------------------------------------------------------------------------
# AWS organization variables
#-------------------------------------------------------------------------------
variable "account_name" {
  description = "Name of the new AWS org account"
  type        = string
}
variable "account_email" {
  description = "Email of the new AWS org account"
  type        = string
}
variable "close_on_deletion" {
  type        = string
  default     = "false"
  description = "If true, a deletion event will close the account. Otherwise, it will only remove from the organization."
}