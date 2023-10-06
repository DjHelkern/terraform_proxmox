variable "PROXMOX_API_SECRET" {
  description = "Proxmox API Secret"
  default     = "api-key"
  sensitive   = true
}

variable "ssh_key" {
  description = "SSH public key"
  default     = "ssh-rsa "
}

variable "host1" {
  description = "First Proxmox host"
  default     = "pve-proxmox-1"
}

variable "host2" {
  description = "Second Proxmox host"
  default     = "pve-proxmox-2"
}

variable "host3" {
  description = "Third Proxmox host"
  default     = "pve-proxmox-3"
}

variable "host4" {
  description = "Fourth Proxmox host"
  default     = "pve-proxmox-4"
}

variable "host5" {
  description = "Fifth Proxmox host"
  default     = "pve-proxmox-5"
}

variable "template_name" {
  description = "Template VM name"
  default     = "debian11.vm"
}
