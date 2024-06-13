variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "example-role"
}

variable "role_policy_name" {
  description = "Name of the IAM role policy"
  type        = string
  default     = "example-role-policy"
}
