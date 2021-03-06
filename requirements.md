---
title: "requirements"
output: html_document
permalink: requirements.html
---

## Meeting host requirements

In order to be able to work smoothly with tools such as `docker`, `git` and `make`, we recommend that you set up a dedicated development environment which allows developing and deploying an Atlas module locally using free and open source software. 

One way to arrive at such a setup quickly is to start with using the [Linux Mint OS](https://linuxmint.com/edition.php?id=249) as the base OS - this is a [popular desktop distro](https://distrowatch.com) which makes use of the Ubuntu package base. This OS can be installed up on a laptop by booting from an ISO and this approach is known to work on 6 year old laptops with 4GB of RAM for this particular use case. At least 8GB of RAM and 40GB of free disk space is recommended though, and 16GB of RAM with 100GB+ disk space is recommended for building and running the full system with all of the components enabled.

This setup is for a *developer environment* and intends to illustrate how to set up the system from scratch on a fully FOSS OS, along with the necessary dependencies need to build and run the system. A desktop OS such as Linux Mint will allow installing additional tools and IDEs such as software development tools for Groovy (grails) and other programming languages and allows for working locally with system development, even under off-line conditions.

It is NOT a production environment setup. For a headless server intended to be deployed in a production environment, a different slimmed down setup would be recommended, where all unnecessary components have been removed.

## Alternate setups

If you choose decide not to run a FOSS operating system, it should still be possible to install `docker`, `docker-compose`, `make` and `git` (for example if using Mac OS); if so, please then search the Internets for relevant [instructions and guidelines](https://docs.docker.com/docker-for-mac/install/). 

If you are using a non-free OS, we however suggest the path of creating a Virtual Machine running inside your existing OS. You can then put Linux Mint OS inside a VM and use that to set up your environment. 

However, for setting up such a VM you need more or less twice the resources in order to be able to run the VM in parallell with the host. VirtualBox runs the VM inside the host and resources are isolated and not shared, so about twice the resources will be needed when compared to installing docker directly on the host.

This means you need a fairly powerful laptop with preferably at least 16 GB of RAM and at least 100 GB of free disk space and you need admin rights on the laptop. 

When you meet those criteria, then please proceed to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Then within Virtual Box, create a new VM that boots up with the earlier linked ISO image. There are plenty of guides on the Internets explaining how to install Virtual Box - please use search engines.

## Installing docker and docker-compose

Once you have a base OS, install `make` and `git` if not already present with:

    sudo apt install make git
    
Install `docker` and `docker-compose` using the [official installation guide for Docker CE](https://docs.docker.com/install/linux/docker-ce/ubuntu/) and [the official installation instructions for docker-compose](https://docs.docker.com/compose/install/#install-compose).

## Post-install steps

After installation of the tools above, use these commands to verify the setup:

    # verify absence of warnings, works without sudo
    docker info

    # verify recent Docker version such as 18.03.0-ce
    docker -v

    # verify recent Docker Compose version, such as
    # docker-compose version 1.20.1
    docker-compose -v
    
    # verify this works
    docker run hello-world
    
    # verify network access
    docker run alpine ping -c 2 ddg.gg
    
## Additional configuration for DNS

For name resolution to work the way that some of the repos expect, you need to make your system aware of the name resolver that will be launched by docker - as often defined in the `docker-compose.yml` file in the `dnsmasq` section.

This will allow you to start services locally using `make up` and then from your laptop launch a browser using a fully qualified domain name (rather than "localhost") such as for example "https://wordpress.bioatlas.se". 

This web traffic will then be routed to the locally running containers for a more realistic scenario also involving TLS (ie https - setting up SSL certificates).

On Linux this configuration can be done by editing `/etc/resolvconf/resolv.conf.d/head`, adding this line:

    nameserver 172.17.0.1

Then restart `resolvconf` using this command:

    sudo systemctl restart resolvconf.service

For variations of how to do this on MacOS and other platforms, please search the Internet and follow relevant guides and instructions. Local DNS setups may vary between for example Ubuntu 18.04 and Ubuntu 19.04 etc, so there is no single recipe that can be given here.


## Reporting issues

If you run into an issue related to any of these materials, please use GitHub to report it here:

* [report any issues or bugs or suggestions](https://github.com/bioatlas/bioatlas-docker/issues).

## Additional configuration for SSL

*Update:* Due to an [issue with self-signed SSL certs](https://github.com/bioatlas/ala-docker/issues/24), configuring self-signed certs will not be necessary for the Uppsala workshop preparation. 

~~First make sure that you copy your certs into a `certs` directory - if you have existing certs - or use the Makefile to generate self-signed certs.~~

~~If the Makefile you are using doesn't already have the necessary targets, see instructions at <https://github.com/bioatlas/zoa-docker> and in particular [the Makefile targets](https://github.com/bioatlas/zoa-docker/blob/master/Makefile#L43-L63) used there. Copy relevant sections with appropriate modifications into your Makefile and then issue:~~

~~# to generate self-signed certs use~~
~~make ssl-certs~~

~~# inspect ssl cert in use with~~
~~make ssl-certs-show~~

~~Using self-signed certificates will require either the CA cert to be imported and installed either system-wide or in each of your apps. If you don't do this, apps will fail to request data using SSL (https).~~

~~So, besides configuring those certs for use in the backend services, you also need to:~~

~~- import the /tmp/certs/ca.pem file into Firefox/Chrome or other browsers or clients that you are using on the client side~~

~~Pls search for documentation on how to do it, for example:~~

~~<https://thomas-leister.de/en/how-to-import-ca-root-certificate/>~~
~~<https://support.mozilla.org/en-US/questions/995117>~~

~~NB: For curl to work, you may need to provide '--cacert /tmp/certs/ca.pem' switch or SSL requests will fail.~~




