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
    pacman-key --init
    pacman -Sy archlinux-keyring manjaro-keyring
    pacman-key --populate archlinux
    pacman-key --populate archlinux manjaro
    pacman-key --refresh-keys
    pacman -Syu
    pacman -Sy --needed base-devel git wget yajl iputils
    groupadd users
    groupadd wheel
    useradd -m neo
    usermod -aG wheel neo
    pacman -S nano
    passwd neo
    sudo -H -u neo bash -c '/root/package_setup.sh'
fi

if test -f "$UPGRADEFILE"; then
    frost -upgrade
    exit
fi

#if test -f "$FILE"; then
#    sudo -H -u neo bash -c '/home/neo/Ultimaker_Cura-4.7.1.AppImage'
#fi
