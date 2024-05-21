
resource "google_secret_manager_secret" "adapter_secret" {
  count = length(var.adapter_secret)

  provider  = google.secure
  secret_id = "prod-app-base-060623-${var.adapter_secret[count.index]}-${terraform.workspace}"

  replication {
    auto {}
  }
}