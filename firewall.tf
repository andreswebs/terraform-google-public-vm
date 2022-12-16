resource "google_compute_firewall" "external_ssh" {
  count   = var.firewall_allow_ssh ? 1 : 0
  name    = "${google_compute_instance.this.name}-external-ssh"
  network = data.google_compute_subnetwork.this.network

  target_tags = [google_compute_instance.this.name]

  source_ranges = var.external_access_ip_whitelist

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}

resource "google_compute_firewall" "external_web" {
  count   = var.firewall_allow_web ? 1 : 0
  name    = "${google_compute_instance.this.name}-external-web"
  network = data.google_compute_subnetwork.this.network

  target_tags = [google_compute_instance.this.name]

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

}
