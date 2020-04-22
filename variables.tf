# Probably the most useful variable, enter
# the domain where you want your website hosted
variable "domain_website" {
}
# Visit https://console.aws.amazon.com/route53/home#hosted-zones:
# and look at the "Hosted Zone ID" column
variable "route53_zone_id" {
}

# Can be anything the user wants
variable "bucket_website_name" {
  default = "Static website hosting bucket"
}
variable "bucket_logs_name" {
  default = "Static website logs bucket"
}
# Set this to 0 to disable caching or
# higher to increase cache time
variable "ttl" {
  default = 300
}

# Can be set if desired
variable "cert_name" {
  default = "Static website certificate"
}
