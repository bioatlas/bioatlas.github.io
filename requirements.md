---
title: "requirements"
output: html_document
permalink: requirements.html
---

## Meeting host requirements

In order to be able to work smoothly with tools such as `docker`, `git` and `make`, we recommend that you set up a dedicated development environment which allows developing and deploying an Atlas module locally using free and open source software. 

One way to arrive at such a setup quickly is to use the [Linux Mint OS](https://linuxmint.com/edition.php?id=249) as the base OS. This OS can be installed up on a laptop by booting from an ISO and this approach is known to work on 6 year old laptops with 4GB of RAM for this particular use case. 

If you choose not to run a FOSS operating system, it should still be possible to install `docker`, `docker-compose`, `make` and `git` (for example if using Mac OS); if so, please then search the Internets for relevant [instructions and guidelines](https://docs.docker.com/docker-for-mac/install/).  

If on a non-free OS, we however suggest the path of creating a Virtual Machine running inside your existing OS. You can then put Linux Mint OS inside a VM and use that. 

However, for setting up such a VM you need more or less twice the resources in order to be able to run the VM in parallell with the host - so you need a laptop with at least 8 GB of RAM (or more) and at least 20-40 GB of free disk space and you need admin rights on the laptop. 

Then please install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and then within Virtual Box, create a new VM that boots up with the earlier linked ISO image. There are plenty of guides on the Internets explaining how to install Virtual Box - please use search engines.

Once you have a base OS, install `make` and `git` if not already present with:

    sudo apt install make git
    
Install `docker` and `docker-compose` using the [official installation guide for Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/) and [the official installation instructions for docker-compose](https://docs.docker.com/compose/install/#install-compose).



