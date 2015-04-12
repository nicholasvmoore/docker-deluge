FROM fedora:latest

RUN su -c 'yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm';\
    su -c 'yum -y localinstall --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm';\
    yum -y install unrar p7zip unzip python-service-identity deluge-daemon tar deluge-web;\
    yum clean all;

ADD deluge.sh /deluge.sh

VOLUME ["/config"]
VOLUME ["/watch"]
VOLUME ["/downloads"]

EXPOSE 80 58846

ENTRYPOINT "deluge.sh"
