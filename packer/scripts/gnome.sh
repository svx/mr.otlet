#!/bin/bash -eux

# Download files to /tmp
wget http://dist.tiramisu.solutions/files.zip -O /tmp/files.zip 

# Unzip /tmp/files.zip
unzip /tmp/files.zip -d /tmp/

# Install 'paper' theme and icons
dpkg -i /tmp/files/paper-gtk-theme_2.1+r263~daily~ubuntu16.04.1_all.deb
dpkg -i /tmp/files/paper-icon-theme_1.3+r567~daily~ubuntu16.04.1_all.deb

# Install gnome-extensions
/tmp/files/gnome-shell-extension-installer 2 3.14 --yes   # Frippery move clock
/tmp/files/gnome-shell-extension-installer 941 3.14 --yes # Show IP extension

# Set Gnome-theme
cd /home/vagrant
sudo -u vagrant gsettings set org.gnome.desktop.wm.preferences theme "Paper"
sudo -u vagrant gsettings set org.gnome.desktop.interface gtk-theme 'Paper'
sudo -u vagrant gsettings set org.gnome.desktop.interface icon-theme 'Paper'

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

# Restart Gnome
gnome-shell --replace



