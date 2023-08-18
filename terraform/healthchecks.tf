module "healthchecks" {
  source  = "USSBA/cstate-healthchecker/aws"
  version = "~> 4.0"

  name_prefix                 = "sba-status-healthchecks"
  retention_period_in_minutes = 5

  github_conf = {
    branch_name                  = "master"
    organization_name            = "USSBA"
    repository_name              = "sba-status"
    oauth_token_ssm_paramter_arn = data.aws_ssm_parameter.github_token.arn
  }
  healthchecks = [
    {
      fqdn               = "www.sba.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/?healthcheck=true"
      evaluation_periods = 1
      alarm_name         = "sbagov"
    },
    {
      fqdn               = "www.sbir.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "sbir"
    },
    {
      fqdn               = "www.nwbc.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "nwbc"
    },
    {
      fqdn               = "advocacy.sba.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "advocacy"
    },
    {
      fqdn               = "data.sba.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "data"
    },
    {
      fqdn               = "certify.sba.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "certify"
    },
    {
      fqdn               = "maps.certify.sba.gov"
      port               = 443
      type               = "HTTPS"
      resource_path      = "/"
      evaluation_periods = 1
      alarm_name         = "certify-hubzone"
    }
  ]
  healthcheck_regions = [
    "us-east-1",
    "us-west-1",
    "us-west-2",
  ]
}
