terraform {
  backend "s3" {
    bucket         = "ussba-mgmt-terraform-state"
    key            = "terraform-sba-status.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ussba-mgmt-terraform-state-locktable"
    acl            = "bucket-owner-full-control"
  }
}
