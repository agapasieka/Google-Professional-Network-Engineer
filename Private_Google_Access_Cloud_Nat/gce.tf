resource "google_compute_instance" "vm_internal" {
  name         = "${var.company_name}-vm-internal"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    source = google_compute_disk.vm_internal_boot.self_link
  }

  network_interface {
    network    = module.vpc.network_name
    subnetwork = module.vpc.subnets_self_links[0]
  }

  labels = {
    os = "linux"
  }

  service_account {
    email  = google_service_account.vm_internal_service_account.email
    scopes = ["cloud-platform"]
  }

  depends_on = [
    module.vpc,
    google_service_account.vm_internal_service_account
  ]
}

