output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_cidr" {
  description = "The CIDR of the Subnet"
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}
