variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-east1"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "dev-vpc"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "dev-subnet-01"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "my_ip" {
  description = "Your public IP (with /32) for SSH access"
  type        = string
}

variable "router_name" {
  description = "Cloud Router name"
  type        = string
  default     = "dev-router"
}

variable "nat_name" {
  description = "Cloud NAT name"
  type        = string
  default     = "dev-nat"
}
