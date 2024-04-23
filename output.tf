output "secret_ids" {
  value = [for index, secret in google_secret_manager_secret.adapter_secret : secret.secret_id]
}