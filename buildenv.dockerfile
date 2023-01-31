from sl:7
RUN yum groupinstall -y "Development Tools"
WORKDIR /build
CMD ["make"]