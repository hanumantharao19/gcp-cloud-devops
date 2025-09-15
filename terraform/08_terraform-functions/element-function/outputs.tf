output "vm_names" {
  value = [for vm in google_compute_instance.vm : vm.name]
}

output "vm_labels" {
  value = [for vm in google_compute_instance.vm : vm.labels]
}
