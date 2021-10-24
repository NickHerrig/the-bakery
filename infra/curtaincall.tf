resource "digitalocean_ssh_key" "nick" {
  name       = "nick"
  public_key = file("${path.module}/ssh_keys/nick.pub")
}

resource "digitalocean_droplet" "curtaincall_web" {
  image      = "ubuntu-20-04-x64"
  name       = "curtaincall-web"
  region     = "nyc1"
  size       = "s-1vcpu-1gb"
  monitoring = "true"
  ssh_keys = [
    digitalocean_ssh_key.nick.fingerprint,
  ]
}

resource "digitalocean_domain" "curtaincall" {
  name = "curtaincall.tech"
}

resource "digitalocean_record" "curtaincall_a" {
  domain = digitalocean_domain.curtaincall.name
  type   = "A"
  name   = "@"
  value  = digitalocean_droplet.curtaincall_web.ipv4_address
  ttl    = "3600"
}

resource "digitalocean_record" "curtaincall_cname_www" {
  domain = digitalocean_domain.curtaincall.name
  type   = "CNAME"
  name   = "www"
  value  = "@"
  ttl    = "43200"
}

resource "digitalocean_record" "curtaincall_caa_letsencrypt" {
  domain = digitalocean_domain.curtaincall.name
  type   = "CAA"
  name   = "@"
  value  = "letsencrypt.org."
  ttl    = "3600"
  flags  = "0"
  tag    = "issue"
}

output "curtaincall" {
  value = digitalocean_droplet.curtaincall_web.ipv4_address
}
