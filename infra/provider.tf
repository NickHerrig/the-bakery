terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    oci = {
      source = "hashicorp/oci"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

provider "oci" {
  region              = "us-ashburn-1"
  auth                = "SecurityToken"
  config_file_profile = "DEFAULT"
}
