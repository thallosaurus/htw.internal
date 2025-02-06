terraform {
  backend "s3" {
    bucket   = "terraform"
    endpoint = "http://nas.htw.internal:9000"

    key = "tf/state"

    region     = "us-east-1"
    access_key = "XLmOIAFuAmEkSPcK7qRA"
    secret_key = "IzIt7u7hGmYbGK0hnoIaCaF9MbcuUVrfu0qTMpo9"

    force_path_style            = true
    skip_credentials_validation = true # Skip AWS related checks and validations
    #skip_requesting_account_id  = true
    skip_metadata_api_check = true
    skip_region_validation  = true

  }

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
    powerdns = {
      source  = "pan-net/powerdns"
      version = "1.5.0"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.70.1"
    }
  }
}

provider "powerdns" {
  #api_key    = "${var.pdns_api_key}"
  api_key = "iamarandomkeychangeme"
  #server_url = "${var.pdns_server_url}"
  server_url     = "http://10.0.0.101:8081/"
  insecure_https = true
}
provider "docker" {
  host     = "ssh://terraform@apps.htw.internal:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}
