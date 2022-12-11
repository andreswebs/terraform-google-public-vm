data "google_project" "this" {}

data "google_compute_image" "ubuntu_lts" {
  project = "ubuntu-os-cloud"
  family  = "ubuntu-2204-lts"
}

locals {
  initial_disk_image = var.initial_disk_image == "" || var.initial_disk_image == null ? data.google_compute_image.ubuntu_lts.self_link : var.initial_disk_image
  hostname           = var.domain_name != null && var.domain_name != "" ? "${var.name}.${var.domain_name}" : null
}

module "network_info" {
  source          = "andreswebs/network-info/google"
  version         = "0.1.0"
  project_network = var.project_network
}

resource "google_compute_address" "this" {
  region = var.region
  name   = "${var.name}-ip"
}

resource "google_compute_address" "this_internal" {
  region       = var.region
  name         = "${var.name}-internal-ip"
  address_type = "INTERNAL"
  subnetwork   = module.network_info.subnetwork[var.region].id
}

resource "google_compute_instance" "this" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  hostname     = local.hostname

  tags = compact(concat([var.name], var.network_tags))

  boot_disk {
    initialize_params {
      size  = var.disk_size
      image = local.initial_disk_image
    }
  }

  network_interface {
    subnetwork = module.network_info.subnetwork[var.region].name
    network_ip = google_compute_address.this_internal.address

    access_config {
      nat_ip = google_compute_address.this.address
    }
  }

  service_account {
    email  = google_service_account.this.email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    ignore_changes = [
      boot_disk[0].initialize_params[0].image
    ]
  }

}
