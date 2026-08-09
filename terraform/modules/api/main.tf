variable "project" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "lambdas" {
  type = list(string)
  default = []
}

resource "aws_api_gateway_rest_api" "api" {
  name = "${var.project}-${var.env}-api"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "any" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = "NONE"
}

# Very simple integration placeholder; in real life you'd integrate to a single Lambda target or a proxy
output "api_invoke_url" {
  value = aws_api_gateway_rest_api.api.execution_arn
}
