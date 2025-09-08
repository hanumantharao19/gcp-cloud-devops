module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 11.1"

    project_id   = "pure-silicon-463515-t5"
    network_name = "example-vpc"
    routing_mode = "GLOBAL"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.10.10.0/24"
            subnet_region         = "us-west1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.10.20.0/24"
            subnet_region         = "us-west1"
            subnet_private_access = "true"
        },
        {
            subnet_name               = "subnet-03"
            subnet_ip                 = "10.10.30.0/24"
            subnet_region             = "us-west1"
        }
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "pod-ip-range"
                ip_cidr_range = "10.100.0.0/16"
            },
            {
                range_name    = "service-ip-range"
                ip_cidr_range = "10.101.0.0/20"
            },
        ]
    }


}

