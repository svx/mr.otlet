#!/bin/bash -eux

# Download files to /tmp
wget http://dist.tiramisu.solutions/files.zip -O /tmp/files.zip

# Unzip /tmp/files.zip
unzip /tmp/files.zip -d /tmp/

# Install 'paper' theme and icons
dpkg -i /tmp/files/paper-gtk-theme_2.1+r263~daily~ubuntu16.04.1_all.deb
dpkg -i /tmp/files/paper-icon-theme_1.3+r567~daily~ubuntu16.04.1_all.deb

# Install gnome-extensions
sudo -u vagrant /tmp/files/gnome-shell-extension-installer 2 3.14 --yes   # Frippery move clock
sudo -u vagrant /tmp/files/gnome-shell-extension-installer 941 3.14 --yes # Show IP extension

# Remove old dconf setting
rm -rf /home/vagrant/.config/dconf

# Move new dconf into place
mv /home/files/dconf /home/vagrant/.config/dconf

# Set permissions right
chown -R vagrant:vagrant /home/vagrant/.config/dconf



