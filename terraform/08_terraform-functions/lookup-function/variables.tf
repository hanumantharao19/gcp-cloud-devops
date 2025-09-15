variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-east1-b"
}

variable "env" {
  description = "Environment (dev, stage, prod)"
  type        = string
}

variable "instance_name" {
  description = "Base name of the VM"
  type        = string
}

variable "image" {
  description = "Image to use for the VM"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "machine_types" {
  description = "Map of environment to machine type"
  type        = map(string)
}

variable "network" {
  description = "VPC network"
  type        = string
}

variable "subnetwork" {
  description = "Subnet inside the network"
  type        = string
}

variable "owner" {
  description = "Owner of the VM"
  type        = string
}
