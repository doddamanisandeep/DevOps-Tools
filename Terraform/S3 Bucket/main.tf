resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "example-s3-bucket"
    Environment = "Dev"
  }
}
