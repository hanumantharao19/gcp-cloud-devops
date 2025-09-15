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

# Create a VM with machine_type selected via lookup()
resource "google_compute_instance" "vm" {
  name         = format("%s-%s", var.env, var.instance_name)
  machine_type = lookup(var.machine_types, var.env, "e2-micro") # fallback if env not in map
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  labels = {
    environment = var.env
    owner       = var.owner
  }
}
