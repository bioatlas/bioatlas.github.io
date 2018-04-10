---
title: welcome
output: html_document
permalink: index.html
---

## Welcome 

Biodiversity Atlas Sweden has all materials available at GitHub so developers, system integrators and system administrators can find notes on how to get started here.

## April 2018 mini workshop

In mid April 2018, a mini-workshop is organized on the topic "Swedish Biodiversity e-infrastructure - today and tomorrow".

- The [Day 2 agenda is here](/agenda)
- Please [prepare using these instructions](/requirements) if you're attending

## What code and documentation is available from GitHub?

You can find a set of repositories used in https://bioatlas.se at GitHub. These repositories - [currently more than 20 repositories](https://github.com/bioatlas) - include various core and non-core parts of the Biodiversity Atlas Sweden. 

Most of the core components use software from [Atlas of Living Australia, with hundreds of repos available from GitHub](https://github.com/AtlasOfLivingAustralia) and therefore most of the existing documentation there remains relevant. 

Therefore a good starting point is [the wiki](https://github.com/AtlasOfLivingAustralia/documentation/wiki) which holds links to more background materials such as this [key technical document](https://www.gbif.org/document/82847/ala-key-technical-documentation-english).

One difference visavi the Atlas of Living Australia components - apart from the various customizations made to address various national adaptations - is that https://bioatlas.se makes extensive use of [`docker`](https://www.docker.com/community-edition) and [`docker-compose`](https://docs.docker.com/compose/overview/) for packaging modules and composing modules into a full running system of micro-services. 

See [this Stack Overflow post](https://stackoverflow.com/questions/16047306/how-is-docker-different-from-a-normal-virtual-machine) for some background on how using containers differs from using traditional VMs.

## Overview of repositories

Here is an overview of some of the important repositories used in Biodiversity Atlas Sweden:

- [bioatlas-docker](https://github.com/bioatlas/ala-docker) - this is currently a code-free repo used for anchoring general work tickets. It also has a couple of associated [GitHub project boards](https://help.github.com/articles/tracking-the-progress-of-your-work-with-project-boards/). This is where general issues are being reported and daily work in the areas of data mobilization work and system integration tasks is being managed.

- [bioatlas.github.io](https://github.com/bioatlas/bioatlas.github.io) - a documentation repository with the content for these web pages. The content is authored using markdown - a lightweight and easy-to-use syntax for styling text. This material is intended to provide this "welcome page" - a starting point for developers, system integrators or system administrators that are looking to getting up to speed working with the software used in Biodiversity Atlas Sweden which is deployed at "bioatlas.se"

- [ala-docker](https://github.com/bioatlas/ala-docker) - the full system as a dockerized composition of software components, where micro-services packaged as containers are combined into the system running at [bioatlas.se](https://bioatlas.se). This is the main composition and it integrates many sub-components which are also available separately in other repositories - including for example various front-end components and back-end services such as [ala-hub](https://github.com/bioatlas/ala-hub), [ala-collectory](https://github.com/bioatlas/ala-collectory), [images](https://github.com/bioatlas/image-service), [api](https://github.com/bioatlas/webapi).

- [wordpress-docker](https://github.com/bioatlas/wordpress-docker) and [bioatlas-wordpress-theme](https://github.com/bioatlas/bioatlas-wordpress-theme) and [artwork](https://github.com/bioatlas/artwork) are repositories that provide the front end landing page for "bioatlas.se" based on the Wordpress CMS and a custom wordpress theme with artwork inspired by (and closely aligned to) the theme used in the [Atlas of Living Australia](https://www.ala.org.au/). These repositories now replace the [earlier front page](https://github.com/bioatlas/ghost-docker) - which made use of another CMS platform called Ghost and which also had [an associated "theme"](https://github.com/bioatlas/gbifse-ghost).

- [mirroreum](https://github.com/bioatlas/mirroreum) - a stack for working with sgeospatial data using R and RStudio Web, but also includes Shiny and a large set of assorted packages are pre-installed (for example from ROpenSci).

- [zoa-docker](https://github.com/bioatlas/zoa-docker) - a composition of components and services for zoological animal tracking.

- [data-mobilization-pipeline](https://github.com/bioatlas/data-mobilization-pipeline) and [bas-gene-data-mobilization](https://github.com/bioatlas/bas-gene-data-mobilization) - provides various tools and examples to support reproducible workflows when migrating data or mobilizing data into various standard formats (.CSV, .DwcA). Various additional ETL tools such as [access2csv](https://github.com/bioatlas/access2csv-docker) can be useful when mobilizing data into a format that can be ingested into the system.

- various non-core services and tools, such as [IPT-to-DCATAP-conversion-tools](https://github.com/bioatlas/dcatap-swe-docker) and [server-monitor-docker](https://github.com/bioatlas/server-monitor-docker)

Individual repositories in general have a README.md file with usage instructions.

## Getting started

A good starting point is the `ala-docker` repo described above. Consult the `README.md` file there, which provides some brief instructions - indicating that `git`, `make`, `docker` and `docker-compose` are required. 

Please first make sure that you take the time to prepare your development environment properly so that you [meet the host requirements](/requirements).

You should then be able to issue these commands in order to get the contents of this repository, then build and start the services locally:

For the workshop, please clone the repository ala-docker and checkout the branch no-ssl-for-uppsala-workshop

*Update:* Instructions have been changed (earlier the branch "solr6-cassandra3" was used) due to an [issue with self-signed SSL certs](https://github.com/bioatlas/ala-docker/issues/24). There is no need to start from scratch if you have the earlier branch, just do "git fetch" and "git checkout no-ssl-for-uppsala-workshop" and proceed as below.
    
    # get code
    git clone https://github.com/bioatlas/ala-docker.git
    cd ala-docker
    git fetch
    git checkout no-ssl-for-uppsala-workshop

    # setting up
    # The Makefile contains a number of rules. For setting up the system execute the following in the order as described.

    # pull the docker images of ALA components
    make pull

    # pull docker images of softwares like solr, cassandra , mysql, wordpress etc.
    make pull2

    # download and unzip the wordpress theme
    make theme-dl
    ./baptize.sh

    # generate random passwords and save them in .env* files in the env
     folder, used for authentication between applications
    make dotfiles

    # create and save admin password for simple authentication
    make htpasswd

    # start up the service
    make up

Now, please verify that you can use the web browser to open the following locations:

    http://bioatlas.se/
    http://bioatlas.se/ala-hub
    http://bioatlas.se/collectory
    http://bioatlas.se/images
    
The [first location](http://bioatlas.se/) will lead to the Wordpress container, which on its first launch will show a setup wizard with some additional steps. Upon completing them, log in to the admin panel and activate the BAS 2018 theme (available under "appearance" in the admin panel).

## Steps after successful installation

Once the installation steps above succeed, next step when using the `ala-docker` system involves [ingesting data](https://github.com/AtlasOfLivingAustralia/documentation/wiki/Upload-data). 

Also, further steps including testing, making code changes, recompiling and making contributions are possible. For making code changes, the Atlas community and software repositories are by nature polyglot and a variety of FOSS-friendly languages and tools are being used, such as Groovy (grails) with CLI tools such as http://sdkman.io/ and Kotlin, Java, Scala (JVM-based), JavaScript, R etc. Here is a [brief intro to Grails](https://docs.google.com/presentation/d/1tF_qEnaQMsF7EVKx6cPleMw8Pc-_fDZpe17s8wkmdAY).

When it comes to open source development tools there are different options for Integrated Development Environments, such as using popular text editors (SublimeText, vi, emacs etc) with configurations or using more traditional language-specific IDEs (NetBeans, Eclipse, IntelliJ IDEA, RStudio etc).

Docker images are portable in the sense that containers can run on a developer's laptop or in a production server or in a cloud-based infrastructure.

## Reporting issues

If you run into an issue related to any of these materials, please use GitHub to report it here:

* [report any issues or bugs or suggestions](https://github.com/bioatlas/ala-docker/issues).
