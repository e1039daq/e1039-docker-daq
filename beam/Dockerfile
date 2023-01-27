FROM sl:7
WORKDIR /opt
COPY ../../daq/beam/BeamDAQ /opt/
COPY assets/entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 
RUN make all
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]