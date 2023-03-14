module "customer_vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = "customer-vpc"
  version      = "6.0.1"

  subnets = [

    {
      subnet_name   = "customer-subnet1"
      subnet_ip     = "10.10.1.0/24"
      subnet_region = var.region

    },
  ]
}
module "producer_vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = "producer-vpc"
  version      = "6.0.1"

  subnets = [

    {
      subnet_name   = "producer-subnet1"
      subnet_ip     = "10.20.1.0/24"
      subnet_region = var.region

    },
  ]
}