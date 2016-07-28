#!/usr/bin/env bash
set -e
set -u
set -x

# Add vagrant user to sudoers.
echo "vagrant ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Update sources.list
cat << EOF > /etc/apt/sources.list
# Added during build
deb http://httpredir.debian.org/debian jessie main contrib non-free
deb-src http://httpredir.debian.org/debian jessie main contrib non-free

deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

# Jessie backports to get a newer version of ansible
deb http://ftp.debian.org/debian jessie-backports main
EOF

