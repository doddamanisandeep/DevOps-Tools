provider "aws" {
  region = "eu-west-2"  # Replace with your desired AWS region
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = ["subnet-006468d9db8f6e59b", "subnet-0762da0866807fc09"] # Replace with your existing subnet IDs
  }

  depends_on = [aws_iam_role_policy_attachment.eks_cluster]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}
