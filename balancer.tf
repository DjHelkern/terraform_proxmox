resource "proxmox_vm_qemu" "balancer1" {
  name        = "balancer-1"
  target_node = var.host3
  vmid        = 208
  clone       = var.template_name
  os_type     = "cloud-init"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 2
  memory      = 6140
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "50G"
    type     = "virtio"
    storage  = "local-lvm"
    iothread = 1
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
  }

  ipconfig0 = "ip=10.14.0.158/24,gw=10.14.0.1"
  ciuser    = "root"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF
}
resource "proxmox_vm_qemu" "balancer2" {
  name        = "balancer-2"
  target_node = var.host5
  vmid        = 209
  clone       = var.template_name
  os_type     = "cloud-init"
  cpu         = "kvm64"
  cores       = 2
  sockets     = 2
  memory      = 6140
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "50G"
    type     = "virtio"
    storage  = "local-lvm"
    iothread = 1
  }

  network {
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = true
    link_down = false
  }

  ipconfig0 = "ip=10.14.0.159/24,gw=10.14.0.1"
  ciuser    = "root"
  sshkeys   = <<EOF
  ${var.ssh_key}
  EOF
}

