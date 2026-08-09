module "lambda_hello" {
  source       = "./modules/lambda"
  name         = "hello"
  handler_path = "./modules/lambda/handlers/hello.py"
  env          = var.env
}

module "lambda_goodbye" {
  source       = "./modules/lambda"
  name         = "goodbye"
  handler_path = "./modules/lambda/handlers/goodbye.py"
  env          = var.env
}

module "api" {
  source      = "./modules/api"
  project     = var.project_name
  env         = var.env
  region      = var.region
  lambdas     = [module.lambda_hello.lambda_arn, module.lambda_goodbye.lambda_arn]
}

module "dns" {
  source      = "./modules/route53"
  domain_name = var.domain_name
  env         = var.env
  api_domain  = module.api.api_invoke_url
}
