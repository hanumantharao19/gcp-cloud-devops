terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.0.0" # or latest stable
    }
  }
}

provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"
}

resource "google_storage_bucket" "bucket" {
  name          = "my-unique-bucket-name-123456789789789789789789789" # must be globally unique
  location      = "US"
  storage_class = "STANDARD"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }

  labels = {
    environment = "dev"
    team        = "cloud"
  }
}

