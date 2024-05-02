# Docker-Based DAQ for the E1039 Experiment at FNAL
The project contains the files neccessary to build a version of each piece of DAQ software 

## Prerequisites
Please install [Docker Engine](https://docs.docker.com/engine/) and [Docker Compose](https://docs.docker.com/compose/). For development purposes you can use [Docker Desktop](https://www.docker.com/products/docker-desktop/), provided licensing requirements are met.

Additionally, this requires files not contained in this repository, specifically those in the `/data4/dockerDAQ/` directory of the `SeaQuestDsk0` server in NM4. We unfortunately do not have access to the source for the version of CODA we use so this step is essential.

## Building
A makefile is included for ease of use. Run `make build` to build the setup.

## Run
You can run the system using `make run`. 

*Note that super-user permissions as well as enabling hardware virtualization extensions may be neccessary*

