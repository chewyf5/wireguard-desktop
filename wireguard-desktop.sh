#!/bin/bash

export SUDO_ASKPASS="___LIB_PATH___/zenity.sh"

ICON_ON=___ICON_PATH___/wireguard-desktop-red.png
ICON_OFF=___ICON_PATH___/wireguard-desktop-gray.png


if ip a | grep -q 'wg0'; then
   sudo -A wg-quick down wg0
   sudo -A sed -i -e "0,\#^Icon=.*#s##Icon=$ICON_OFF#" ___DESKTOP_FILE_PATH___/wireguard-desktop.desktop
else
   sudo -A wg-quick up wg0
   sudo -A sed -i -e "0,\#^Icon=.*#s##Icon=$ICON_ON#" ___DESKTOP_FILE_PATH___/wireguard-desktop.desktop
fi
