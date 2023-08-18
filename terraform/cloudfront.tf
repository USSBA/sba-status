resource "aws_cloudfront_distribution" "distribution" {
  aliases = [
    "status.sba.gov",
  ]
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2"
  price_class         = "PriceClass_100"
  retain_on_delete    = false
  wait_for_deployment = true

  default_cache_behavior {
    allowed_methods = [
      "DELETE",
      "GET",
      "HEAD",
      "OPTIONS",
      "PATCH",
      "POST",
      "PUT",
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress               = false
    default_ttl            = 0
    max_ttl                = 0
    min_ttl                = 0
    smooth_streaming       = false
    target_origin_id       = "status.sba.gov-static-content"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers                 = []
      query_string            = true
      query_string_cache_keys = []

      cookies {
        forward           = "all"
        whitelisted_names = []
      }
    }

    function_association {
      event_type   = "viewer-request"
      function_arn = "arn:aws:cloudfront::502235151991:function/status-sba-gov-subdirectory-index"
    }
    function_association {
      event_type   = "viewer-response"
      function_arn = "arn:aws:cloudfront::502235151991:function/status-sba-gov-security-headers"
    }
  }

  logging_config {
    bucket          = "${local.account_id}-${local.region}-logs.s3.amazonaws.com"
    include_cookies = true
    prefix          = "cloudfront/sba-status/default/"
  }

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = "status.sba.gov-static-content.s3.amazonaws.com"
    origin_id           = "status.sba.gov-static-content"

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/E3C8EZRS9X2F26"
    }
  }

  restrictions {
    geo_restriction {
      locations        = []
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:502235151991:certificate/e1ce4a48-ba5b-446a-9dcf-bc2664378353"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2018"
    ssl_support_method             = "sni-only"
  }
}
