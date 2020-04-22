variable "domain_website" {
  description = "Probably the most useful variable, enter the domain where you want your website hosted"
}
variable "route53_zone_id" {
  description = "Visit https://console.aws.amazon.com/route53/home#hosted-zones: and look at the \"Hosted Zone ID\" column"
}

variable "bucket_website_name" {
  default = "Static website hosting bucket"
  description = "Tag Name for the website bucket"
}
variable "bucket_logs_name" {
  default = "Static website logs bucket"
  description = "Tag Name for the logs bucket"
}
variable "ttl" {
  default = 300
  description = "Set this to 0 to disable caching or higher to increase cache time"
}
variable "cert_name" {
  default = "Static website certificate"
  description = "Name of the ACM certificate"
}
