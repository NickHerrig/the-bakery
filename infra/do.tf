resource "digitalocean_ssh_key" "nick" {
  name       = "nick"
  public_key = file("${path.module}/ssh_keys/nick.pub")
}

resource "digitalocean_droplet" "nebula-lighthouse" {
  image      = "ubuntu-20-04-x64"
  name       = "nebula-lighthouse"
  region     = "nyc1"
  size       = "s-1vcpu-1gb"
  monitoring = "true"
  ssh_keys = [
    digitalocean_ssh_key.nick.fingerprint,
  ]
}

output "nebula-lighthouse" {
  value = digitalocean_droplet.nebula-lighthouse.ipv4_address
}
