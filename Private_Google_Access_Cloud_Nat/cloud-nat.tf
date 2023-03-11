resource "google_compute_router" "router" {
  provider = google-beta
  name     = "${var.company_name}-router"
  network  = module.vpc.network_name
  region   = var.region
}

resource "google_compute_address" "ext_ip" {
  provider = google-beta
  name     = "${var.company_name}-ip-addr"
  region   = var.region
}

module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "2.2.2"
  name                               = "${var.company_name}-nat"
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.router.name
  network                            = module.vpc.network_name
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetworks                        = var.subnetworks
  nat_ip_allocate_option             = false
  nat_ips                            = google_compute_address.ext_ip.*.self_link
  min_ports_per_vm                   = "1024"
  log_config_enable                  = "true"
  log_config_filter                  = "ERRORS_ONLY"
  depends_on                         = [module.vpc]
}
