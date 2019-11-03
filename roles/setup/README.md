# Setup The Bakery

## Manual pre-setup
Some manual steps are needed prior to running the setup ansible configuration.
It is necesary that the following steps are completed:
- ssh is enabled on all machines
- public key is copied to all machines** `.ssh/authorized_keys` **location
- change pi user's password

## networking.yml playbook
The networking.yml playbook is responsible mostly for configuring the proper linux networking files. This is done through the `/templates` directory and includes files: 
-  hosts - <https://en.wikipedia.org/wiki/Hosts_(file)>
- [hostname](https://en.wikipedia.org/wiki/Hostname)
- [resolv.conf](https://en.wikipedia.org/wiki/Resolv.conf)
- [dhcpcd.conf](https://en.wikipedia.org/wiki/DHCPD)

