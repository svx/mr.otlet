#!/bin/bash -eux

# Download files to /tmp
wget 

# Unzip /tmp/files.zip
unzip

# Install 'paper' theme and icons
dpkg -i /tmp/files/
dpkg -i /tmp/files

# Install gnome-extensions
./tmp/files/gnome-shell-extension-installer 2 3.14 --yes   # Frippery move clock
./tmp/files/gnome-shell-extension-installer 941 3.14 --yes # Show IP extension

# Set Gnome-theme
cd /home/vagrant
sudo vagrant -u gsettings set org.gnome.desktop.interface gtk-theme 'Paper'
sudo vagrant -u gsettings set org.gnome.desktop.interface icon-theme 'Paper'

# Set Gnome Fonts
sudo -u vagrant gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 10'
sudo -u vagrant gsettings set org.gnome.desktop.interface font-name 'Cantarell Regular10'
sudo -u vagrant gsettings set org.gnome.desktop.interface document-font-name 'Sans Regular 10'
sudo -u vagrant gsettings set org.gnome.desktop.interface monospace-font-name "Monospace Regular 10"

# Set Gnome Background
sudo -u vagrant gsettings set org.gnome.desktop.background primary-color "#425265"
sudo -u vagrant gsettings set org.gnome.desktop.background secondary-color "#425265"
sudo -u vagrant gsettings set org.gnome.desktop.background color-shading-type "solid"
sudo -u vagrant gsettings set org.gnome.desktop.background picture-options "none"





