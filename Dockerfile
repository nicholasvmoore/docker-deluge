FROM fedora:latest

RUN su -c 'yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm';\
    su -c 'yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm';\
    yum -y install unrar p7zip unzip python-service-identity deluge-daemon tar deluge-web;\
    yum clean all;

ADD deluge.sh /deluge.sh

VOLUME ["/config"]
VOLUME ["/watch"]
VOLUME ["/downloads"]

EXPOSE 8112 53160 53161 53162 53163 53164 53165 53166 53167 53168 53160/udp 53161/udp 53162/udp 53163/udp 53164/udp 53165/udp 53166/udp 53167/udp 53168/udp 58846

ENTRYPOINT "/deluge.sh"
