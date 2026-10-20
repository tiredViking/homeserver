variable "zone_name" {
  type        = string
  description = "Name of the SDN zone. Lowercase letters and digits only."

  validation {
    condition     = can(regex("^[a-z][a-z0-9]{0,7}$", var.zone_name))
    error_message = "zone_name must start with a letter, contain only lowercase letters and digits, and be at most 8 characters long."
  }
}

variable "node_names" {
  type        = list(string)
  description = "Names of the Proxmox nodes on which the SDN zone is applied."

  validation {
    condition     = length(var.node_names) > 0
    error_message = "node_names must contain at least one node."
  }

  validation {
    condition = alltrue([
      for n in var.node_names : can(regex("^[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?$", n))
    ])
    error_message = "Every entry in node_names must be a valid hostname: letters, digits and hyphens only, starting and ending with a letter or digit, at most 63 characters."
  }
}

variable "ipam" {
  type        = string
  description = "Type of IPAM used in the SDN zone."
  default     = "pve"
}

variable "vnet_name" {
  type        = string
  description = "Type of IPAM used in the SDN zone."
}

variable "subnet_cidr" {
  type        = string
  description = "subnet cidr"
}

variable "gateway" {
  type        = string
  description = "Default gateway for the subnet"
  default     = null
}