
resource "google_secret_manager_secret" "adapter_secret" {
  for_each = toset(var.adapter_secret)

  provider  = google.secure
  secret_id = "prod-app-base-060623-${each.value}-${terraform.workspace}"

  replication {
    auto {}
  }
}