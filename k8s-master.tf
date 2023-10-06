resource "proxmox_vm_qemu" "k8s-1-master" {
  name        = "k8s-1.master"
  target_node = var.host1
  vmid        = 201
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

  ipconfig0 = "ip=10.14.0.151/24,gw=10.14.0.1"

  ciuser  = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k8s-2-master" {
  name        = "k8s-2.master"
  target_node = var.host3
  vmid        = 202
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

  ipconfig0 = "ip=10.14.0.152/24,gw=10.14.0.1"

  ciuser  = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}

resource "proxmox_vm_qemu" "k8s-3-master" {
  name        = "k8s-3.master"
  target_node = var.host5
  vmid        = 203
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

  ipconfig0 = "ip=10.14.0.153/24,gw=10.14.0.1"

  ciuser  = "root"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
