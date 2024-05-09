FROM sl:7
RUN yum install -y epel-release
RUN yum groupinstall -y "Development Tools"
RUN yum install -y root boost boost-thread boost-devel libpng-devel glibc-devel
# RUN mkdir -p /opt/{etSpy,fileToEvent}

RUN groupadd -g 1000 e1039daq
RUN useradd -rm -d /home/e1039daq -s /bin/sh -g e1039daq -u 1000 e1039daq
USER e1039daq
# COPY assets/etSpy /opt/etSpy
# COPY assets/fileToEvent /opt/fileToEvent
# COPY assets/root /opt/root


WORKDIR /build
CMD ["make"]