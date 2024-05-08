FROM sl:7
RUN yum install -y epel-release
RUN yum groupinstall -y "Development Tools"
RUN yum install -y root boost boost-thread boost-devel

USER e1039daq
WORKDIR /build
CMD ["make"]