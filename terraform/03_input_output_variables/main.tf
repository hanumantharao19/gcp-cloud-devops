#####################################################
# Provider configuration
#####################################################
provider "google" {
  project = var.project_id
  region  = var.region
}

#####################################################
# Create VPC
#####################################################
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

#####################################################
# Create Subnet
#####################################################
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}
