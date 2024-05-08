FROM sl:7
RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod +x /usr/local/bin/simple-gtk-prompt
RUN yum install -y epel-release
RUN yum install -y xauth dbus-x11 gtkmm30 screen xterm root boost boost-thread 
RUN mkdir -p /opt /data2 /data4

RUN groupadd -g 1000 e1039daq
RUN useradd -rm -d /home/e1039daq -s /bin/sh -g e1039daq -u 1000 e1039daq

USER e1039daq
RUN mkdir -p /opt /data2 /data4
WORKDIR /opt
COPY assets/ /opt/
COPY entrypoint.sh /opt/
WORKDIR /opt/BeamDAQ 

ENTRYPOINT ["/bin/sh", "/opt/entrypoint.sh"]