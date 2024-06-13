resource "aws_iam_role" "example_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"  # Change this to the appropriate service
        },
      },
    ],
  })

  tags = {
    Name = var.role_name
  }
}

resource "aws_iam_role_policy" "example_role_policy" {
  name   = var.role_policy_name
  role   = aws_iam_role.example_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "s3:ListBucket",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ],
  })
}
