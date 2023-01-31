#!/bin/bash

# Add proper XAUTHKEY for each container
for container in beam scaler; do \
    mkdir -p $container/assets; \
    sed "s=XAUTHKEY=$(xauth list | head -n 1)=" $container/templates/entrypoint.sh > $container/assets/entrypoint.sh ; \
done

# Copy files for BeamDAQ
/bin/cp -rf /localstorage/daq/beam/BeamDAQ beam/assets

# Copy files for ScalerDAQ
mkdir -p scaler/assets/etc scaler/assets/home
/bin/cp -rf /localstorage/backups/e1039sc4/etc/host* beam/assets/etc
/bin/cp -rf /localstorage/daq/scaler/home/e1039daq scaler/assets/home