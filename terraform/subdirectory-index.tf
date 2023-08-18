resource "aws_cloudfront_function" "subdirectory_index" {
  comment = "default Subdirectory Index"
  name    = "status-sba-gov-subdirectory-index"
  publish = true
  runtime = "cloudfront-js-1.0"
  code    = file("${path.module}/subdirectory.js")
}
