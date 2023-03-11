resource "google_compute_disk" "vm_internal_boot" {
  name    = "vm-internal-boot"
  project = var.project_id
  type    = "pd-balanced"
  zone    = var.zone
  image   = "projects/debian-cloud/global/images/debian-11-bullseye-v20221206"
  size    = "10"
}

