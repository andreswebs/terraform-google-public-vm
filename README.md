# terraform-google-public-vm

Creates a VM with a public IP in GCP.

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "vm" {
  source      = "github.com/andreswebs/terraform-google-public-vm"
  name        = var.name
  region      = var.region
  zone        = var.zone
  domain_name = var.domain_name
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Boot disk size | `number` | `50` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | (Optional) Domain name used for the host | `string` | `null` | no |
| <a name="input_external_access_ip_whitelist"></a> [external\_access\_ip\_whitelist](#input\_external\_access\_ip\_whitelist) | List of IPs allowed to SSH | `list(string)` | `[]` | no |
| <a name="input_firewall_allow_ssh"></a> [firewall\_allow\_ssh](#input\_firewall\_allow\_ssh) | (Optional) Allow external SSH traffic? | `bool` | `true` | no |
| <a name="input_firewall_allow_web"></a> [firewall\_allow\_web](#input\_firewall\_allow\_web) | (Optional) Allow external web traffic (HTTP and HTTPS)? | `bool` | `true` | no |
| <a name="input_initial_disk_image"></a> [initial\_disk\_image](#input\_initial\_disk\_image) | VM initial disk image | `string` | `null` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Machine type | `string` | `"e2-standard-2"` | no |
| <a name="input_name"></a> [name](#input\_name) | VM name | `string` | n/a | yes |
| <a name="input_network_tags"></a> [network\_tags](#input\_network\_tags) | Additional VM network tags | `list(string)` | `[]` | no |
| <a name="input_project_network"></a> [project\_network](#input\_project\_network) | Project network to use | `string` | `"default"` | no |
| <a name="input_region"></a> [region](#input\_region) | Compute region | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Compute zone | `string` | n/a | yes |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_info"></a> [network\_info](#module\_network\_info) | andreswebs/network-info/google | 0.1.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | Instance external IP |
| <a name="output_hostname"></a> [hostname](#output\_hostname) | Instance hostname |
| <a name="output_instance"></a> [instance](#output\_instance) | The `google_compute_instance` resource |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | Instance internal IP |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The `google_service_account` resource |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 4.43 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.43 |

## Resources

| Name | Type |
|------|------|
| [google_compute_address.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_address.this_internal](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.external_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_firewall.external_web](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_project_iam_member.log_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.metric_writer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.tracer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_compute_image.ubuntu_lts](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
