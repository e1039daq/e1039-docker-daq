FROM sl:7
WORKDIR /opt
COPY assets/BeamDAQ /opt/
COPY assets/entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 
RUN yum groupinstall -y "Development Tools"
RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod +x /usr/local/bin/simple-gtk-prompt
RUN yum install -y xauth dbus-x11 gtkmm30 screen xterm
RUN make all
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]