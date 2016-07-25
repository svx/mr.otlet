#!/bin/bash

if [[ ! "$DESKTOP" =~ ^(true|yes|on|1|TRUE|YES|ON])$ ]]; then
  exit
fi

echo "==> Installing ubunutu-desktop"
apt-get install -y ubuntu-gnome-desktop python-flake8 python-pip curl


