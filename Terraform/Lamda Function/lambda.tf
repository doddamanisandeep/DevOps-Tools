resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_role.arn
  filename      = "${path.module}/package/lambda_function.zip"

  source_code_hash = filebase64sha256("${path.module}/package/lambda_function.zip")

  tags = {
    Name = "my-lambda-function"
  }
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.my_lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}
