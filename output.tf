output "secrets_info" {
  value = google_secret_manager_secret.adapter_secret.name
}