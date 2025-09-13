# GCP project and region
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-east1"
}

# VPC configuration
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-vpc"
}

# Subnet configuration
variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "dev-subnet-01"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}
