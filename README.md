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

- [ala-docker](https://github.com/bioatlas/ala-docker) - the full system as a dockerized composition of software components, where micro-services packaged as containers are combined into the system running at [bioatlas.se](https://bioatlas.se). This is the main composition and it integrates many sub-components which are also available separately in other repositories - including for example various front-end components and back-end services such as [ala-hub](https://github.com/bioatlas/ala-hub) and [ala-collectory](https://github.com/bioatlas/ala-collectory).

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
    
    # get code
    git clone https://github.com/bioatlas/ala-docker.git
    
    # build and start
    make

Once these steps succeed, further steps including testing, making changes, recompiling and making contributions are possible.

## Reporting issues

If you run into an issue related to any of these materials, please use GitHub to report it here:

* [report any issues or bugs or suggestions](https://github.com/bioatlas/bioatlas-docker/issues).


