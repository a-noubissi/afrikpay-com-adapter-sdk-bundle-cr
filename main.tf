locals {
  secret_list = flatten([for project, value in var.adapter_secret :
    flatten([for index, secret in value :
      {
        project = project
        secret  = lower(secret)
      }
    ])
  ])
}

resource "google_secret_manager_secret" "adapter_secret" {
  for_each = tomap({ for index, record in local.secret_list : index => record })

  provider  = google.secure
  secret_id = "prod-app-base-060623-${each.value.project}-${each.value.secret}-${terraform.workspace}"

  replication {
    auto {}
  }
}