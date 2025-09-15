variable "project_id" {}
variable "region" { default = "us-east1" }
variable "zone"   { default = "us-east1-b" }

variable "env" {
  description = "Environment (dev, prod, etc.)"
  type        = string
}

variable "instance_names" {
  description = "List of VM base names"
  type        = list(string)
}

variable "machine_type" {
  default = "e2-micro"
}

variable "network" {}
variable "subnetwork" {}

variable "default_labels" {
  description = "Common labels applied to all VMs"
  type        = map(string)
  default     = {
    owner = "devops-team"
    cost  = "shared"
  }
}
