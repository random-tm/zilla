export LIBGL_ALWAYS_INDIRECT=1
export NO_AT_BRIDGE=1
export TERM=xterm
export DISPLAY=:1
export PATH=$PATH:/usr/local/sbin/
export PATH=$PATH:/usr/sbin/
export PATH=$PATH:/sbin

chattr -i /etc/resolv.conf
rm -rf /etc/resolv.conf
# Change this to the nameserver you need
echo "nameserver 192.168.1.43" > /etc/resolv.conf
chattr +i /etc/resolv.conf

FILE=/root/steam
INITFILE=/root/init
UPGRADEFILE=/root/upgrade

if test -f "$INITFILE"; then
    apt update
    apt upgrade -y
    apt install apt-utils
    apt install sudo
    apt install wget
    apt install nano
    apt install software-properties-common
    sleep 5
    apt update
    apt upgrade -y
    adduser neo
    usermod -aG sudo neo
fi

if test -f "$UPGRADEFILE"; then
    apt update
    apt upgrade -y
    exit
fi

if test -f "$FILE"; then
    sudo -u neo steam
fi
