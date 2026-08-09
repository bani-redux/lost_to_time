variable "domain_name" {
  type = string
}

variable "env" {
  type = string
}

variable "api_domain" {
  type = string
}

# This uses a placeholder: in a real deployment you'd look up the hosted zone and point records at the gateway
resource "aws_route53_record" "api" {
  zone_id = "Z0000000000DUMMY"
  name    = var.domain_name
  type    = "CNAME"
  ttl     = 300
  records = ["api.${var.domain_name}"]
}

output "record" {
  value = aws_route53_record.api.fqdn
}
