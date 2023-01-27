FROM sl:7
WORKDIR /opt/coda
RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod +x /usr/local/bin/simple-gtk-prompt
RUN yum install -y xauth dbus-x11 gtkmm30 java-1.6.0-openjdk 
RUN mkdir -p /usr/local/coda /etc
# COPY ../../daq/scaler/coda /usr/local/
COPY ../../backups/e1039sc4/etc/hosts.allow /etc/
COPY ../../backups/e1039sc4/etc/hosts.deny /etc/
COPY ../../backups/e1039sc4/etc/hosts /etc/
COPY ../../backups/e1039sc4/etc/hostname /etc/
# RUN rm -rf /usr/local/coda/2.6.1/common/rcdb/* /usr/local/coda/2.6.1/common/rcdb.org/*
COPY ../../backups/e1039sc4/home/e1039daq /opt/coda/
COPY assets/entrypoint.sh /opt/
COPY ../../backups/e1039sc4/home/e1039daq/.tcshrc ~
COPY ../../backups/e1039sc4/home/e1039daq/dosetupcoda261 ~
RUN ln -s /opt/coda/e1039daq /home/e1039daq
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]