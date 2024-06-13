variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "example-policy"
}

variable "policy_description" {
  description = "Description of the IAM policy"
  type        = string
  default     = "An example policy"
}
