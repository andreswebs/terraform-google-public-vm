output "instance" {
  value       = google_compute_instance.this
  description = "The `google_compute_instance` resource"
}

output "service_account" {
  value       = google_service_account.this
  description = "The `google_service_account` resource"
}

output "internal_ip" {
  value       = google_compute_address.this_internal.address
  description = "Instance internal IP"
}

output "external_ip" {
  value       = google_compute_address.this.address
  description = "Instance external IP"
}
