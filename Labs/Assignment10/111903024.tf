terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}
provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_volume" "vm" {
  name = "vm"
  pool = "default" # List storage pools using virsh pool-list
  source ="./jammy-server-cloudimg-amd64.img"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "vm" {
  name   = "vm"
  memory = "512"
  vcpu   = 2

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.vm.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
