data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_ssm_parameter" "github_token" {
  name = "/sba-status/github_token"
}

locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  account_ids = {
    default = "502235151991"
  }
}
