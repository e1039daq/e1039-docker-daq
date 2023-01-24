FROM sl:7
WORKDIR /opt
COPY /localstorage/daq/backup/e1039beam4/home/e1039daq/seaquest-daq/BeamDAQ .
WORKDIR /opt/BeamDAQ
RUN make all
CMD ["cd /opt/BeamDAQ/",". /opt/BeamDAQ/setup.sh", "/opt/BeamDAQ/scripts/run_beamDAQ_forever.sh
"]