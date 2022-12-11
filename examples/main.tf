module "vm" {
  source      = "github.com/andreswebs/terraform-google-public-vm"
  name        = var.name
  region      = var.region
  zone        = var.zone
  domain_name = var.domain_name
}