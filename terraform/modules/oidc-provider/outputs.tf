output "oidc_provider_arn" {
  description = "IAM OIDC Provider ARN"
  value       = aws_iam_openid_connect_provider.this.arn
}

output "oidc_provider_url" {
  description = "OIDC Provider URL"
  value       = aws_iam_openid_connect_provider.this.url
}