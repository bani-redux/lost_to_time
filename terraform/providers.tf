terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Uncomment and fill for remote state when ready
# backend "s3" {
#   bucket = "my-terraform-state-bucket"
#   key    = "lost_to_time/terraform.tfstate"
#   region = "us-east-1"
# }

provider "aws" {
  region = var.region
  # access_key = "DUMMY"
  # secret_key = "DUMMY"
}
