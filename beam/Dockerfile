FROM sl:7
RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod +x /usr/local/bin/simple-gtk-prompt
RUN yum install -y epel-release
RUN yum install -y xauth dbus-x11 gtkmm30 screen xterm root boost boost-thread 
RUN mkdir -p /opt
WORKDIR /opt
COPY /data4/dockerDAQ/assets/beam/ /opt/
COPY entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 
ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]