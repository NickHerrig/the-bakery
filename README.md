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

My current favorite is Ubuntu.
In my humble opinion, I believe it is the most well documented, and easiest to work with OS!
I downloaded an Ubuntu Server image for the pi the on their [site](https://ubuntu.com/download/raspberry-pi).
That site also has some great info on which version/flavor you should go with.

## Initial Setup

### Select an operating system

Briefly mentioned above, currently i'm using the 32 bit Ubuntu 18.04.4 LTS as my OS.

### Flash Ubuntu on to your microSD cards
I use [BelenaEtcher](https://www.balena.io/etcher/), as it's super straight forward and saves me time.

### Enable SSH on microSDs
not sure if this is needed on ubuntu server, but I'd assume it is..
https://www.raspberrypi.org/blog/a-security-update-for-raspbian-pixel/
TODO: test on third pi server

### Find pi IP with nmap
```
nmap -sP 192.168.0.0/24
```

### Copy public ssh key to the host .ssh/authorized_keys

### Add host to ansible hosts

### run ansible networking.yml
