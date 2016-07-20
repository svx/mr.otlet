========
Packages
========

vim git python-pip htop chrome gnome3 sublime-text3 aspell and myspell retext



other install stuff
===================

later:- gnome-extensions [with a script]
done:- theme deb. packages
done:- set theme via gconf editor [script]
- docker
- docker container
- bashrc
- vimrc
- alexrc
- sublime config

done:Change theme from command-line
===================================

gsettings set org.gnome.desktop.interface gtk-theme "CoolestThemeOnEarth"

done:Change Icon-Theme
=======================

gsettings set org.gnome.desktop.interface icon-theme 'MyIconTheme'

done:Change Window-Theme
=========================

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

done:Set background
====================
gsettings set org.gnome.desktop.background primary-color "#425265"
gsettings set org.gnome.desktop.background secondary-color "#425265"
gsettings set org.gnome.desktop.background color-shading-type "solid"
gsettings set org.gnome.desktop.background picture-options "none"

Make sure we run above settings as a script as user vagrant, something like:
sudo -u wayne '/home/wayne/script2.sh' 

See example below:

# Prevent the screen from locking
done: sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.session idle-delay 0
done: sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
done: sudo -u vagrant dbus-launch gsettings set org.gnome.desktop.lockdown disable-lock-screen true

## Next
- vim settings
- sublime settings
- bashrc

For vim:

https://github.com/tpoisot/dotfiles/blob/master/.vimrc
http://timotheepoisot.fr/2014/01/01/vim-writing-environment/
http://naperwrimo.org/wiki/index.php?title=Vim_for_Writers
https://afterdraft.co/~aardvark/writing-with-vim
