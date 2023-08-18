provider "aws" {
  region              = "us-east-1"
  allowed_account_ids = [local.account_ids[terraform.workspace]]
  default_tags {
    tags = {
      Environment     = "default"
      TerraformSource = "sba-status/terraform"
      ManagedBy       = "terraform"
    }
  }
}

