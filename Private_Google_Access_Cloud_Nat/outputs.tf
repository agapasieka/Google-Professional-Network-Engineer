output "vm_internal_name" {
  description = "vm-internal name"
  value       = google_compute_instance.vm_internal.name
}

output "vm_internal_zone" {
  description = "Test-vm name"
  value       = google_compute_instance.vm_internal.zone
}

output "subnets_names" {
  value       = [for subnet in module.vpc.subnets : subnet.name]
  description = "The names of subnets being created"
}