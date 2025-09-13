provider "google" {
  project = "<YOUR_PROJECT_ID>"
  region  = "us-east1"
}

# Create VPC
resource "google_compute_network" "vpc" {
  name                    = "dev-vpc"
  auto_create_subnetworks = false
}

# Create Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "dev-subnet-01"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"
  network       = google_compute_network.vpc.id
}

