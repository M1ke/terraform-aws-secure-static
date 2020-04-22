provider "aws" {
  alias = "main"
}

provider "aws" {
  alias = "us-east-1"
}

module "certs-us-east-1" {
  source = "./modules/acm"

  providers = {
    aws = aws.us-east-1
  }

  domain_website = var.domain_website
  route53_zone_id = var.route53_zone_id
  cert_name = var.cert_name
}

module "lambda-rewrite" {
  source = "./modules/lambda-rewrite"

  providers = {
    aws = aws.us-east-1
  }
}

module "website" {
  source = "./modules/static-website"

  providers = {
    aws = aws.main
  }

  domain_website = var.domain_website
  route53_zone_id = var.route53_zone_id

  # Provided by other modules
  acm_arn = module.certs-us-east-1.acm_arn
  lambda_arn = module.lambda-rewrite.lambda_arn

  # Defaults
  bucket_website_name = var.bucket_website_name
  bucket_logs_name = var.bucket_logs_name
  ttl = var.ttl
}

