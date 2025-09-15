variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "Zone for the VM"
  type        = string
  default     = "us-east1-b"
}

variable "vm_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "private-vm"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-medium"
}

variable "network_name" {
  description = "Existing VPC network name"
  type        = string
}

variable "subnet_name" {
  description = "Existing Subnet name"
  type        = string
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
}

variable "public_key_path" {
  description = "Path to your public SSH key"
  type        = string
}
