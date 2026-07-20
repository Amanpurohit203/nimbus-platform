data "aws_iam_policy_document" "irsa_trust" {

  for_each = var.irsa_roles

  statement {

    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {

      type = "Federated"

      identifiers = [
        var.oidc_provider_arn
      ]
    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${each.value.namespace}:${each.value.service_account}"
      ]
    }

    condition {

      test = "StringEquals"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:aud"

      values = [
        "sts.amazonaws.com"
      ]
    }
  }
}


resource "aws_iam_role" "irsa" {

  for_each = var.irsa_roles

  name = each.value.role_name

  assume_role_policy = data.aws_iam_policy_document.irsa_trust[each.key].json

  tags = merge(
    var.tags,
    each.value.tags,
    {
      Name = each.value.role_name
    }
  )
}