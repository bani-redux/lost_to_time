output "lambda_arns" {
  value = [module.lambda_hello.lambda_arn, module.lambda_goodbye.lambda_arn]
}

output "api_invoke_url" {
  value = module.api.api_invoke_url
}

output "dns_record" {
  value = module.dns.record
}
