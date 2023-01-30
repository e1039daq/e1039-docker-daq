FROM sl:7
WORKDIR /opt
COPY localstorage/daq/beam/BeamDAQ /opt/
COPY assets/entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 
RUN yum group install "Development Tools"
RUN make all
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]