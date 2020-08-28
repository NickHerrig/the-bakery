# The Bakery

A delicous rack of Pies, mmmmmmm

## Introduction

The Bakery is a cluster of 4 Raspberry Pi computers originally created for learning:

- Networking concepts
- Load balancing applications
- Multi-Server application deployment
- Distributed infrastructure configuration management

The Bakery will be fully managed via Ansible (minus a few setup steps)
I also plan to do a few writeups on various experiments, benchmarks while learning tools/languages. 

The Bakery was originally inspired by Jeff Gerling and his Raspberry Pi [Dramble](https://www.pidramble.com/).

### Hardware

- 4 Raspberry Pi 3 Model B
- 4 32 GB microSD cards 
- 4 micro USB cables 
- 4 Ethernet cables 
- 1 Ethernet switch 

### Operating System

Although I'm consistently playing around with different operating systems like:

- Chrome OS
- Debian
- Raspbian
- Kali
- Mint
- Gentoo

I've decided to utilizing raspberry Pi OS Lite(32-bit) which is a port of the Debian
distribution with no desktop enviornment.

## Initial Setup

### Flash OS on microSD cards
Raspberry Pi provides a solid imaging tool called 
[Raspberry Pi Imager](https://www.raspberrypi.org/downloads/)
[Read](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/) more about it! 

### Enable SSH
navigate to /Volumes/boot on microSD and `touch ssh`

### Find pi IP with nmap
```
nmap -sP 192.168.0.0/24

```

### Configure a static IP Address
Edit the raspberry pis dhcpcd.conf file and add line
```shell
static ip_address={static-ip}
```
example: static ip_address=192.168.0.4/24

### Copy public ssh key to the host .ssh/authorized_keys
Once ssh is configured, we will complete the rest of our configuration, deployment, and management via ansible.
