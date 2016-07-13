========
Packages
========

vim git python-pip htop chrome gnome3 sublime-text3 aspell and myspell retext


update sources list: https://wiki.debian.org/SourcesList

other install stuff
===================

- gnome-extensions [with a script]
- theme deb. packages
- set theme via gconf editor [script]
- docker
- docker container
- bashrc
- vimrc
- alexrc
- sublime config

Change theme from command-line
==============================

gsettings set org.gnome.desktop.interface gtk-theme "CoolestThemeOnEarth"

Change Icon-Theme
=================

gsettings set org.gnome.desktop.interface icon-theme 'MyIconTheme'

Change Window-Theme
===================

gsettings set org.gnome.desktop.wm.preferences theme "CoolestThemeOnEarth"

Install gnome-extensions via script:

- download/clone: https://github.com/brunelli/gnome-shell-extension-installer

Run: gnome-shell-extension-installer 2 3.14 --yes

This will install the Frippery move clock extension

Run: gnome-shell-extension-installer 941 3.14 --yes

This will install show ip extension
Set font size:
[https://ask.fedoraproject.org/en/question/42224/how-do-i-change-font-size-in-gnome/]

gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 10'
gsettings set org.gnome.desktop.interface font-name 'Cantarell Regular10'
gsettings set org.gnome.desktop.interface document-font-name 'Sans Regular 10'
gsettings set org.gnome.desktop.interface monospace-font-name "Monospace Regular 10"

Set background
==============
gsettings set org.gnome.desktop.background primary-color "#425265"
gsettings set org.gnome.desktop.background secondary-color "#425265"
gsettings set org.gnome.desktop.background color-shading-type "solid"
gsettings set org.gnome.desktop.background picture-options "none"

Make sure we run above settings as a script as user vagrant, something like:
sudo -u wayne '/home/wayne/script2.sh' 

See example below:

# Prevent the screen from locking
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.session idle-delay 0
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.lockdown disable-lock-screen true
