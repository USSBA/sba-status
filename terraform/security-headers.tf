resource "aws_cloudfront_function" "security_headers_response" {
  comment = "default Security Headers Injection on viewer-response"
  name    = "status-sba-gov-security-headers"
  publish = true
  runtime = "cloudfront-js-1.0"
  code    = file("${path.module}/hsts.js")
}

