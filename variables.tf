variable "name" {
  type        = string
  description = "VM name"
}

variable "subnetwork" {
  type        = string
  description = "Name of the subnetwork to use"
  default     = "default"
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "e2-standard-2"
}

variable "region" {
  type        = string
  description = "Compute region"
}

variable "zone" {
  type        = string
  description = "Compute zone"
}

variable "disk_size" {
  type        = number
  description = "Boot disk size"
  default     = 50
}

variable "initial_disk_image" {
  type        = string
  description = "VM initial disk image"
  default     = null
}

variable "network_tags" {
  type        = list(string)
  description = "Additional VM network tags"
  default     = []
}

variable "domain_name" {
  type        = string
  description = "(Optional) Domain name used for the host"
  default     = null
}

variable "firewall_allow_ssh" {
  type        = bool
  description = "(Optional) Allow external SSH traffic?"
  default     = true
}

variable "firewall_allow_web" {
  type        = bool
  description = "(Optional) Allow external web traffic (HTTP and HTTPS)?"
  default     = true
}

variable "external_access_ip_whitelist" {
  type        = list(string)
  description = "List of IPs allowed to SSH"
  default     = []
}

variable "extra_disks" {
  type = list(object({
    name     = string
    zone     = string
    type     = optional(string, "pd-ssd")
    size     = optional(number, 50)
    snapshot = optional(string, null)
  }))

  description = "(Optional) List of additional disks to attach to the instance"
  default     = []
}
