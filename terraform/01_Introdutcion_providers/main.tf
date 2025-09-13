#####################################################
# Terraform required providers
#####################################################
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"  # Use Google provider version 5.x
    }
  }
}

#####################################################
# Provider configuration
#####################################################
provider "google" {
  project     = "<YOUR_PROJECT_ID>"          # Replace with your GCP project ID
  region      = "us-east1"                   # Choose your region
  credentials = file("service-account.json") # Path to your service account JSON
}

#####################################################
# Create a simple Compute Engine instance
#####################################################
resource "google_compute_instance" "vm_instance" {
  name         = "simple-ubuntu-instance"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  # Boot disk with Ubuntu
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"  # Ubuntu 22.04 LTS
    }
  }

  # Network interface: use default network and assign external IP
  network_interface {
    network       = "default"
    access_config {}  # External IP
  }
}
