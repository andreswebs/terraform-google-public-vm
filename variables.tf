variable "name" {
  type        = string
  description = "VM name"
}

variable "project_network" {
  type        = string
  description = "Project network to use"
  default     = "default"
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "e2-standard-2"
}

variable "region" {
  type        = string
  description = "Compute Region"
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
