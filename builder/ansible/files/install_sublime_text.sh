#!/bin/bash
# Sublime Text 3 install script

# Reset in case getopts has been used previously in the shell.
OPTIND=1

# Default installation directory
# Note: this is hardcoded in the .desktop file provided by the ST3 tarball, so
# changing it will *not* work without manually editing that file
INSTALLATION_DIR="/opt/sublime_text"
PREFIX="/usr"

# Unfortunately it seems that Gnome doesn't look for icons in /usr/local,
# so icons have to be installed directly into /usr
ICON_PREFIX="/usr"

# Fetch latest build number from sublimetext.com
BUILD="$(echo $(curl http://www.sublimetext.com/3) | sed -rn "s#.*The latest build is ([0-9]+)..*#\1#p")"

# Detect the architecture
if [ "$(uname -m)" = "x86_64" ]; then
  ARCHITECTURE="x64"
else
  ARCHITECTURE="x32"
fi
URL="http://download.sublimetext.com/sublime_text_3_build_${BUILD}_${ARCHITECTURE}.tar.bz2"

function show_help {
  echo "Helper script for installing Sublime Text 3."
  echo "Run without options to download and install."
  echo "Options:"
  echo "-h Display this help message."
  echo "-u Remove ST3 that was previously installed by this script."
  echo "-p Also install Package Control."
}

function check_root {
  if (( $EUID != 0 )); then
    echo "Please run this script as root or use sudo."
    exit 1
  fi
}

function uninstall {
  rm -rf $INSTALLATION_DIR
  rm -f $PREFIX/bin/subl
  rm -f $PREFIX/share/applications/sublime_text.desktop
  rm -f $ICON_PREFIX/share/icons/hicolor/16x16/apps/sublime-text.png
  rm -f $ICON_PREFIX/share/icons/hicolor/32x32/apps/sublime-text.png
  rm -f $ICON_PREFIX/share/icons/hicolor/48x48/apps/sublime-text.png
  rm -f $ICON_PREFIX/share/icons/hicolor/128x128/apps/sublime-text.png
  rm -f $ICON_PREFIX/share/icons/hicolor/256x256/apps/sublime-text.png
  gtk-update-icon-cache $ICON_PREFIX/share/icons/hicolor/
}

while getopts "h?up:" opt; do
  case "$opt" in
    h|\?)
      show_help
      exit 0
      ;;
    u)
      check_root
      uninstall
      exit 0
      ;;
    p)
      INSTALL_PACKAGE_CONTROL=1
      ;;
  esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

check_root

# Download the tarball, unpack and install
curl -o /tmp/st3.tar.bz2 $URL
if tar -xf /tmp/st3.tar.bz2 --directory=/tmp; then
  # Uninstall current installation, if it exists
  uninstall
  mv /tmp/sublime_text_3 $INSTALLATION_DIR
  echo "#!/bin/sh" > /tmp/subl
  echo "exec $INSTALLATION_DIR/sublime_text \"\$@\"" >> /tmp/subl
  chmod +x /tmp/subl
  mv /tmp/subl $PREFIX/bin
else
  rm /tmp/st3.tar.bz2
  exit 1
fi
rm /tmp/st3.tar.bz2

# optionally install package control
if [ -n "$INSTALL_PACKAGE_CONTROL" ]; then
  curl -o $HOME/Package\ Control.sublime-package https://sublime.wbond.net/Package%20Control.sublime-package
  mv $HOME/Package\ Control.sublime-package "$INSTALLATION_DIR/Packages/"
fi

# Add to applications list
ln -s $INSTALLATION_DIR/sublime_text.desktop $PREFIX/share/applications/sublime_text.desktop

# Add icons
ln -s $INSTALLATION_DIR/Icon/16x16/sublime-text.png $ICON_PREFIX/share/icons/hicolor/16x16/apps/sublime-text.png
ln -s $INSTALLATION_DIR/Icon/32x32/sublime-text.png $ICON_PREFIX/share/icons/hicolor/32x32/apps/sublime-text.png
ln -s $INSTALLATION_DIR/Icon/48x48/sublime-text.png $ICON_PREFIX/share/icons/hicolor/48x48/apps/sublime-text.png
ln -s $INSTALLATION_DIR/Icon/128x128/sublime-text.png $ICON_PREFIX/share/icons/hicolor/128x128/apps/sublime-text.png
ln -s $INSTALLATION_DIR/Icon/256x256/sublime-text.png $ICON_PREFIX/share/icons/hicolor/256x256/apps/sublime-text.png
gtk-update-icon-cache $ICON_PREFIX/share/icons/hicolor/

echo ""
echo "Sublime Text 3 installed successfully!"
echo "Run with: subl"
