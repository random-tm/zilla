export LIBGL_ALWAYS_INDIRECT=1
export NO_AT_BRIDGE=1
export TERM=xterm
export DISPLAY=:1
export PATH=$PATH:/usr/local/sbin/
export PATH=$PATH:/usr/sbin/
export PATH=$PATH:/sbin

#FILE=/root/curarun
INITFILE=/root/init
UPGRADEFILE=/root/upgrade

if test -f "$INITFILE"; then
    echo "nameserver 8.8.8.8" > /etc/resolv.conf
    apt update
    apt upgrade -y
    apt install apt-utils
    apt install sudo
    apt install wget
    apt install nano
    apt install software-properties-common
    add-apt-repository ppa:graphics-drivers/ppa -y
    sleep 5
    apt update
    apt upgrade -y
    apt install nvidia-driver-470
    adduser neo
    usermod -aG sudo neo
fi

if test -f "$UPGRADEFILE"; then
    apt update
    apt upgrade -y
    exit
fi

#if test -f "$FILE"; then
#    sudo -H -u neo bash -c '/home/neo/Ultimaker_Cura-4.7.1.AppImage'
#fi
