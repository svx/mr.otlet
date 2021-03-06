# Adjust root filesystem
set -x

export DEBIAN_FRONTEND=noninteractive

# Update the box
apt-get -qqy update
#apt-get -qqy install linux-headers-$(uname -r) build-essential

# Update sourcelist
cat << EOF > /etc/apt/sources.list
# Added during build
deb http://httpredir.debian.org/debian jessie main contrib non-free
deb-src http://httpredir.debian.org/debian jessie main contrib non-free

deb http://httpredir.debian.org/debian jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free
EOF

apt-get -qqy update
apt-get -qqy install linux-headers-$(uname -r) build-essential
# Install base tools
apt-get -qqy install curl wget

# Test file upload

# Remove unneeded items
apt-get -qy purge exim4 exim4-base

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Disable barriers on root filesystem
sed -i 's/noatime,errors/nobarrier,noatime,nodiratime,errors/' /etc/fstab

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
