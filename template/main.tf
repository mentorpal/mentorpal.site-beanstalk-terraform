provider "aws" {
  region = var.aws_region
}

module "mentorpal_beanstalk_deployment" {
    # change the tag below as needed
    # or use source="./.." for local dev
    source      = "git::https://github.com/mentorpal/terraform-mentorpal-aws-beanstalk?ref=tags/0.1.0"
    aws_acm_certificate_domain      = var.aws_acm_certificate_domain
    aws_availability_zones          = var.aws_availability_zones
    aws_region                      = var.aws_region
    aws_route53_zone_name           = var.aws_route53_zone_name
    eb_env_env_vars                 = var.eb_env_env_vars
    eb_env_namespace                = var.eb_env_namespace
    eb_env_stage                    = var.eb_env_stage
    google_client_id                = var.google_client_id
    secret_api_key                  = var.secret_api_key
    secret_jwt_key                  = var.secret_jwt_key
    secret_mongo_uri                = var.secret_mongo_uri
    site_domain_name                = var.site_domain_name
}

output "efs_file_system_id" {
  description = "id for the efs file system (use to mount from beanstalk)"
  value       = module.mentorpal_beanstalk_deployment.efs_file_system_id
}