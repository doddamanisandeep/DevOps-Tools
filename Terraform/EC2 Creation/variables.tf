variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Example AMI ID, replace with one from your region
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
