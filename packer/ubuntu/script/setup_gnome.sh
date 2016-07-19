#!/bin/bash

if [[ ! "$DESKTOP" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi


# Install base apps
apt-get install -y wget curl htop unzip retext mc vim git python-pip pandoc

# Install theme and icons
add-apt-repository ppa:snwh/pulp -y
apt-get update -y
apt-get install -y paper-icon-theme
apt-get install -y paper-gtk-theme
apt-get install -y paper-cursor-theme

# Setting up theme, fonts and icons
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.interface gtk-theme "Paper"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.wm.preferences theme "Paper"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.interface icon-theme 'Paper'
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 10'
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.interface font-name 'Cantarell Regular10'
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.interface document-font-name 'Sans Regular 10'
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.interface monospace-font-name "Monospace Regular 10"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.background primary-color "#425265"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.background secondary-color "#425265"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.background color-shading-type "solid"
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.background picture-options "none"

# Install sublime-text-3 via PPA
add-apt-repository ppa:webupd8team/sublime-text-3 -y
apt-get update -y
apt-get install -y sublime-text-installer
