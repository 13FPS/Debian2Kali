#!/bin/bash -v

### Install needed packages
apt-get update
apt-get install -y dirmngr

### Add the Kali Linux GPG keys to aptitude ###
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ED444FF07D8D0BF6

### Replace the Debian repos with Kali repos ###
mv /etc/apt/sources.list /etc/apt/sources.list.debian
cat <<EOF > /etc/apt/sources.list
deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib
EOF

### Update and install base packages ###
apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y install kali-linux-default
apt-get -y install kali-menu
apt-get -y install kali-desktop-xfce

### Double-check that nothing else needs to be updated ###
apt-get update
apt-get -y upgrade
apt-get -y full-upgrade

### Clean up ###
apt-get -y autoremove --purge
apt-get clean
echo Done.
