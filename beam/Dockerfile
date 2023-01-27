FROM sl:7
WORKDIR /opt
COPY /localstorage/daq/beam/BeamDAQ .
COPY assets/entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 
RUN make all
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]