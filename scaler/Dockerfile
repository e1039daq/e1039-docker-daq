FROM sl:7

WORKDIR /
RUN mkdir -p /usr/local/coda /etc /opt/coda /home /opt/coda/e1039daq /tmp /data2 /data4 /opt/E906ScalerDAQ /software/{etSpy,fileToEvent,root}
WORKDIR /opt/coda

RUN curl -L https://github.com/ngpaladi/simple-gtk-prompt/releases/download/v0.1.0/simple-gtk-prompt --output /usr/local/bin/simple-gtk-prompt
RUN chmod a+x /usr/local/bin/simple-gtk-prompt
RUN yum install -y epel-release
RUN yum install -y net-tools root nmap xauth dbus-x11 gtkmm30 java-1.6.0-openjdk vsftpd sudo screen xterm tcsh telnet  glibc.i686 compat-libstdc++-33-3.2.3-72.el7.i686  xinetd rsh-server openmotif libXp tftp tftp-server xorg-x11-fonts-misc xorg-x11-fonts-100dpi.noarch xorg-x11-fonts-75dpi.noarch xorg-x11-fonts-ISO8859-1-100dpi xorg-x11-fonts-ISO8859-1-75dpi glibc.i686 libXp.i686 libXpm.i686 libXt.i686 libXmu.i686 libgcc.i686 libXcursor.i686 cronie
RUN yum install -y systemd-libs.i686 --setopt=protected_multilib=false
RUN yum install -y libpng openssl-libs.i686 openssl-libs.x86_64 openssl.x86_64 freetype.i686 freetype.x86_64

COPY assets/libstdc++.so.5.0.7 /usr/lib
COPY assets/libXm.so.3.0.2 /usr/lib
COPY assets/libXm.a /usr/lib
COPY assets/e1039sc4.e1039daq.crontab /opt

RUN ln -s libstdc++.so.5.0.7 libstdc++.so.5
RUN ln -s libXm.so.3.0.2 libXm.so.3


ENV FTP_USER=e1039daq \
	FTP_PASS=ftp \
	GID=1000 \
	UID=1000

RUN groupadd -g $GID $FTP_USER
RUN groupadd -g 500 ${FTP_USER}500
RUN useradd -rm -d /home/$FTP_USER -s /bin/sh -g $FTP_USER -u $UID $FTP_USER
RUN usermod -a -G ${FTP_USER}500 ${FTP_USER}
RUN mkdir -p /home/$FTP_USER
RUN chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
RUN echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd


COPY assets/etc/vsftpd.conf /etc
COPY assets/home/e1039daq /home/$FTP_USER/
RUN mkdir -p /home/$FTP_USER/data

RUN chown $FTP_USER:$FTP_USER /home/$FTP_USER/*
RUN chown $FTP_USER:$FTP_USER /home/$FTP_USER/V1495scaler_daq
RUN chown $FTP_USER:$FTP_USER /home/$FTP_USER/tftpboot	

COPY assets/etc/hosts.allow /etc
COPY assets/etc/hosts.deny /etc
COPY assets/etc/hosts /opt
COPY assets/etc/hostname /etc
COPY assets/etc/hosts.equiv /etc

COPY entrypoint.sh /opt

COPY assets/E906ScalerDAQ /opt/E906ScalerDAQ
COPY assets/home/e1039daq/.tcshrc /root
COPY assets/home/e1039daq/dosetupcoda261 /root

COPY assets/etSpy /software/etSpy
COPY assets/fileToEvent /software/fileToEvent
COPY assets/root /software/root

RUN ln -s /home/$FTP_USER/data /root
RUN mkdir /opt/coda/data
WORKDIR /home/$FTP_USER

RUN yum install -y libXft-2.3.2-2.el7.i686 

EXPOSE 22 111 513 514 8101 11111 33106 34585 37011 39221 41991 45000/tcp 45000/udp 45200/udp 45001 45301 45303 45400 45401 60654 20 21 40000-40009

ENTRYPOINT ["/bin/tcsh", "/opt/entrypoint.sh"]
