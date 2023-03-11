# project_id   = "Your Project" - Input variable, leave commented out
# company_name = "company name" - Input variable, leave commented
region         = "europe-west1"
zone           = "europe-west1-c"
zones          = ["europe-west1-b", "europe-west1-c", "europe-west1-d"]
public_subnet  = "public-subnet"
private_subnet = "private-subnet"
subnetworks = [
  {
    name                     = "public-subnet"
    source_ip_ranges_to_nat  = ["ALL_IP_RANGES"]
    secondary_ip_range_names = []
  },
]