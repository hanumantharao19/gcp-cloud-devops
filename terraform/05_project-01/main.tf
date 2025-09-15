terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0" # latest stable
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Compute Instance in existing VPC & Subnet
resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts" # Ubuntu 22.04 LTS
      size  = 20
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name
    # no external IP -> private instance
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  tags = ["private-vm"]
}
