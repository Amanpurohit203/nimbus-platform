##################################################
# IRSA Policy Attachments
##################################################

locals {

  irsa_policy_attachments = flatten([

    for role_key, role in var.irsa_roles : [

      for policy_arn in role.managed_policy_arns : {

        role_key   = role_key
        role_name  = role.role_name
        policy_arn = policy_arn

      }

    ]

  ])

}