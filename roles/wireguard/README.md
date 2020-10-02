# Wireguard
Wireguard is a fast, modern, and secure VPN tunnel written in Go and C.

## Requirenments 
 - Access: The need to access local network resources from anywhere.
 - Secure: Rather than utilizing only port forwarding for multiple resources, one forward
   rule plus the use of wireguard vpn protocol is attractive.
 - Performance: wireguard beats IPsec/OpenVPN in both throughput and ping time.
 - Minimal Complexity: Less code than competitors!
 - Ease of Automation: wireguard can be configured with files, the shell, and utilizes 
   linux core utils.

## Technical Details
 - a tunnel is created with a virtual network interface called wg0 on client and server.
 - a static IP for router from ISP or Dynamic DNS (DDNS). 
 - Port forwarding setup to forward {router-ip}:{port} to vpn server (NAT).


## Automation Notes
These are steps to eventually be automated 

### Install wireguard on VPN server

```shell
sudo apt install wireguard
```

### Generate security keys 
```shell
sudo su 
cd /etc/wireguard
umask 077
wg genkey | tee server_private_key | wg pubkey > server_public_key
wg genkey | tee client_private_key | wg pubkey > client_public_key
```

### Generate server configuration wg0.conf 
More to come on contents.
Need network addapter name, sever private key, peer public key
```
touch /etc/wireguard/wg0.conf
```

### Enable IP Forwarding on the Server 
```shell
vim /etc/sysctl.conf
```
Uncomment the line - "net.ipv4.ip_forward=1"


### Enable systemd wireguard on reboot
```shell
systemctl enable wg-quick@wg0
chown -R root:root /etc/wireguard/
chmod -R og-rwx /etc/wireguard/*
```

### Setup Port Forwarding On The Router
This will differ deppending on router.
Can I automate this with an API?
Currently mannually set through admin consel on local network.
LAN IP, Starting port, ending port, protocol, report port, remote ip.

### Set Up the WireGuard Client

