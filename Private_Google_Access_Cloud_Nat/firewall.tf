resource "google_compute_firewall" "allow_ssh_iap" {
  name    = "allow-ssh-iap"
  network = module.vpc.network_name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = [
    "35.235.240.0/20"
  ]
  target_service_accounts = [google_service_account.vm_internal_service_account.email]
  depends_on              = [module.vpc.network_name]
}