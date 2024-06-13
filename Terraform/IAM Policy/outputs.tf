output "policy_arn" {
  description = "The ARN of the IAM policy"
  value       = aws_iam_policy.example_policy.arn
}

output "policy_name" {
  description = "The name of the IAM policy"
  value       = aws_iam_policy.example_policy.name
}
