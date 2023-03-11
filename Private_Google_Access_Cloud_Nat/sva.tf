resource "google_service_account" "vm_internal_service_account" {
  account_id   = "vm-internal-service-account"
  display_name = "Dedicated sva to apply fw rules"
  project      = var.project_id
}
