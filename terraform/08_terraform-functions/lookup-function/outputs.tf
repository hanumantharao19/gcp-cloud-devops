output "vm_name" {
  value = google_compute_instance.vm.name
}

output "vm_machine_type" {
  value = google_compute_instance.vm.machine_type
}

output "vm_labels" {
  value = google_compute_instance.vm.labels
}
