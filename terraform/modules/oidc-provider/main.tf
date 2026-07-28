data "tls_certificate" "this" {
  url = var.oidc_issuer_url
}

resource "aws_iam_openid_connect_provider" "this" {

  url = var.oidc_issuer_url

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.this.certificates[0].sha1_fingerprint
  ]

  tags = merge(
    var.tags,
    {
      Name = "oidc-provider"
    }
  )
}