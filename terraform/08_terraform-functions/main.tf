terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Create a VM using element() to pick names from list
resource "google_compute_instance" "vm" {
  count        = length(var.instance_names)
  name         = format("%s-%s", var.env, element(var.instance_names, count.index))
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  # merge() to combine default + env-specific labels
  labels = merge(
    var.default_labels,
    {
      environment = var.env,
      role        = element(var.instance_names, count.index)
    }
  )
}
