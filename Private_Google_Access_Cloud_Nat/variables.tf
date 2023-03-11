variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "GCP primary region identifier"
  type        = string
}

variable "zone" {
  description = "GCP primary zone identifier"
  type        = string
}

variable "zones" {
  description = "GCP zone identifier"
  type        = list(any)
}

variable "company_name" {
  description = "Company name"
  type        = string
}

variable "public_subnet" {
  description = "Public subnet"
  type        = string
}

variable "private_subnet" {
  description = "Private subnet"
  type        = string
}

variable "subnetworks" {
  type = list(object({
    name                     = string,
    source_ip_ranges_to_nat  = list(string)
    secondary_ip_range_names = list(string)
  }))
  default = []
}