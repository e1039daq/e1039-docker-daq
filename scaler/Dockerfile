FROM sl:7
WORKDIR /opt/coda
COPY /localstorage/daq/backup/e1039sc4/usr/local/coda /usr/local/
RUN rm -rf /usr/local/coda/2.6.1/common/rcdb/* /usr/local/coda/2.6.1/common/rcdb.org/*
COPY /localstorage/daq/backup/e1039sc4/home/e1039daq /opt/coda/
RUN yum install -y dbus-x11 java-1.6.0-openjdk
RUN ln -s /opt/coda/e1039daq /home/e1039daq
CMD ["cd /opt/coda/e1039daq","./PreCoda", "rcgui &"]