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
  description = "Company name'"
  type        = string
}
