variable "name" {
  type = string
}

variable "handler_path" {
  type = string
}

variable "env" {
  type = string
}

variable "lambda_runtime" {
  type    = string
  default = "python3.9"
}

variable "lambda_handler" {
  type    = string
  default = "handler.handler"
}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.name}-${var.env}-lambda-exec"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "basic_exec" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "this" {
  filename         = var.handler_path
  function_name    = "${var.name}-${var.env}"
  role             = aws_iam_role.lambda_exec.arn
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.handler_path)
  memory_size      = 128
  timeout          = 10
  # This is intentionally simplistic: in a real setup you'd build a zip and reference that.
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}
