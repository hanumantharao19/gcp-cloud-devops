output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_zone" {
  value = google_compute_instance.vm.zone
}

output "network_used" {
  value = google_compute_instance.vm.network_interface[0].network
}

output "subnet_used" {
  value = google_compute_instance.vm.network_interface[0].subnetwork
}
