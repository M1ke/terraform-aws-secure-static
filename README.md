# Terraform Secure Static Site module

This module provides a secure static website, hosted on S3 and delivered via Cloudfront using a certificate provided by ACM. It also supports canonical URLs of the format `website.com/about/` by mapping path prefixes to the `index.html` file under that directory. It's the most complete implementation of a static website pattern that I've been able to find so far.

An example of usage for a real project [can be seen here](https://github.com/M1ke/secure-static-site)

## Required variables

* `domain_website` Probably the most useful variable, enter the domain where you want your website hosted
* `route53_zone_id` Visit https://console.aws.amazon.com/route53/home#hosted-zones and look at the "Hosted Zone ID" column

## Required providers

Your website can be deployed in a region of your choosing, but ACM and Lambda functions for Cloudfront must be deployed in `us-east-1`. Therefore the module expects two providers:

* `aws.main` An AWS provider in any region (can be us-east-1)
* `aws.us-east-1` An AWS provider for us-east-1

## Optional variables

* `bucket_website_name` Tag Name for the website bucket (default: "Static website hosting bucket")
* `bucket_logs_name` Tag Name for the logs bucket (default: "Static website logs bucket")
* `ttl` Default TTL on cloudfront (default: 300)
* `cert_name` Name of the ACM certificate (default: "Static website certificate") 
