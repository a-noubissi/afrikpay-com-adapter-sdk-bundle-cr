
resource "google_secret_manager_secret" "adapter_secret" {
  provider  = google.secure
  secret_id = "prod-app-base-060623-${var.adapter_secret}-${terraform.workspace}"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "secret-version" {
  provider  = google.secure
  
  count = ( var.secret_value == "NULL") ? 0 : 1
  
  secret = google_secret_manager_secret.adapter_secret.id

  secret_data = var.secret_value
  deletion_policy= terraform.workspace == "prod" ? "DISABLE" : "DELETE"
}
