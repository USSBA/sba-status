resource "aws_s3_bucket" "sba_status" {
  bucket = "status.sba.gov-static-content"
}

resource "aws_s3_bucket_logging" "sba_status" {
  bucket        = aws_s3_bucket.sba_status.id
  target_bucket = "${local.account_id}-${local.region}-logs"
  target_prefix = "s3/${local.account_id}/${aws_s3_bucket.sba_status.id}/"
}

data "aws_iam_policy_document" "sba_status" {
  # Grant read to cloudfront's OAI
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.sba_status.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3C8EZRS9X2F26"]
    }
  }
}

resource "aws_s3_bucket_policy" "sba_status" {
  bucket = aws_s3_bucket.sba_status.id
  policy = data.aws_iam_policy_document.sba_status.json
}
