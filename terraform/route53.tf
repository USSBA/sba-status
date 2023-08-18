resource "aws_route53_record" "record" {
  name    = "status.sba.gov"
  type    = "A"
  zone_id = "Z08700103AKIPHI5JW1XB"

  alias {
    evaluate_target_health = true
    name                   = "d1kje02r9anexx.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
}

