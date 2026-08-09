variable "project_name" {
  type    = string
  default = "lost-to-time-sample"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "domain_name" {
  type    = string
  default = "example.com"
}

variable "lambda_runtime" {
  type    = string
  default = "python3.9"
}

variable "lambda_handler" {
  type    = string
  default = "handler.handler"
}

variable "lambda_memory" {
  type    = number
  default = 128
}

variable "lambda_timeout" {
  type    = number
  default = 10
}
