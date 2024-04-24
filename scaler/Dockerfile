FROM sl:7
WORKDIR /
RUN mkdir -p /usr/local/coda /etc /opt/coda /home /opt/coda/e1039daq
WORKDIR /opt/coda
RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod +x /usr/local/bin/simple-gtk-prompt
RUN yum install -y xauth dbus-x11 gtkmm30 java-1.6.0-openjdk screen xterm tcsh
# COPY localstorage/daq/scaler/coda /usr/local/
COPY assets/etc/hosts.allow /etc/
COPY assets/etc/hosts.deny /etc/
COPY assets/etc/hosts /etc/
COPY assets/etc/hostname /etc/
# RUN rm -rf /usr/local/coda/2.6.1/common/rcdb/* /usr/local/coda/2.6.1/common/rcdb.org/*
COPY assets/home/e1039daq /opt/coda/e1039daq
COPY assets/entrypoint.sh /opt/
COPY assets/home/e1039daq/.tcshrc ~
COPY assets/home/e1039daq/dosetupcoda261 ~
RUN ln -s /opt/coda/e1039daq /home/e1039daq
RUN ln -s /opt/coda/e1039daq/data ~
RUN mkdir /opt/coda/data
WORKDIR /opt/coda/e1039daq
ENTRYPOINT ["/bin/tcsh", "/opt/entrypoint.sh"]
