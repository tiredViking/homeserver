resource "proxmox_virtual_environment_container" "trilium_container" {
  description = "Trilium container test,managed by Terraform"

  node_name = "lenovo"
  vm_id     = 108

   cpu {
      architecture = "amd64"
      cores = 2
   }
  # newer linux distributions require unprivileged user namespaces
  unprivileged = true
  features {
    nesting = true
    keyctl = true
  }

  initialization {
    hostname = "trilium.home.lan"

    ip_config {
      ipv4 {
        address = "dhcp" 
        #address = "192.168.1.12/24"
        #gateway = "192.168.1.1"
      }
    }

   # user_account {
   #  keys = [
   #     trimspace(tls_private_key.ubuntu_container_key.public_key_openssh)
   #   ]
   #   password = random_password.ubuntu_container_password.result
   # }
  }

  network_interface {
    bridge = "vmbr0"
    name = "eth0"
    mac_address = "BC:24:11:91:F2:98"
  }

  disk {
    datastore_id = "local-lvm"
    size         = 5
  }

  mount_point {
   backup = true
   volume = "hard_disk:108/vm-108-disk-0.raw"
   path = "/root/trilium-data"

   }

   memory {
      dedicated = 2048
   }
  operating_system {
    template_file_id = proxomox_download_file.debian-13-standard_lxc.id
    # Or you can use a volume ID, as obtained from a "pvesm list <storage>"
    # template_file_id = "local:vztmpl/jammy-server-cloudimg-amd64.tar.gz"
    type = "debian"
  }
   
   started = true
  
   start_on_boot = true
}

resource "proxomox_download_file" "debian-13-standard_lxc" {
  content_type = "vztmpl"
  datastore_id = "hard_disk"
  node_name    = "lenovo"
  url          = "http://download.proxmox.com/images/system/debian-13-standard_13.6-1_amd64.tar.zst"
}

