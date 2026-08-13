output "cloudfront_url" {
  description = "CloudFront distribution URL"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "bucket_name" {
  description = "S3 bucket name"
  value       = aws_s3_bucket.website.id
}