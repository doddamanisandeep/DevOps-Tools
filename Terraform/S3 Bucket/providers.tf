provider "aws" {
  region = "us-west-2"  # Replace with your desired region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
