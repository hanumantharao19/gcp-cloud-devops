project_id     = "my-gcp-demo-project"
region         = "us-east1"
zone           = "us-east1-b"

# Environment can be switched between dev / stage / prod
env            = "prod"

instance_name  = "appserver"
image          = "ubuntu-os-cloud/ubuntu-2204-lts"

network        = "default"
subnetwork     = "default"

owner          = "hanumantha"

# Map of machine types based on environment
machine_types = {
  dev   = "e2-micro"
  stage = "e2-small"
  prod  = "n1-standard-2"
}
