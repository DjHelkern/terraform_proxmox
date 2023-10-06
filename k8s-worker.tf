resource "proxmox_vm_qemu" "k8s-1-worker" {
  count       = 2
  name        = "k8s-${1 + count.index}.worker"
  target_node = var.host2
  vmid        = 204 + count.index
  clone       = var.template_name
  os_type     = "cloud-init"
  cpu         = "kvm64"
  cores       = 8
  sockets     = 2
  memory      = 12288
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "150G"
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

  ipconfig0 = "ip=10.14.0.${154 + count.index}/24,gw=10.14.0.1"

  ciuser  = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k8s-2-worker" {
  count       = 2
  name        = "k8s-${3 + count.index}.worker"
  target_node = var.host4
  vmid        = 206 + count.index
  clone       = var.template_name
  os_type     = "cloud-init"
  cpu         = "kvm64"
  cores       = 8
  sockets     = 2
  memory      = 12288
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot     = 0
    size     = "150G"
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

  ipconfig0 = "ip=10.14.0.${156 + count.index}/24,gw=10.14.0.1"

  ciuser  = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
