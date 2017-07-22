#!/bin/sh

# downloaded from:
# https://gist.github.com/samba/69e1ca11f9d04f218b9b

# TODO  prova detta med i3; kolla lösenordskodningen med base64; generara själv?

# This assumes you have access to the system via SSH already, and need
# remote VNC access as the same user, and you want only the primary display.
export DISPLAY=:0

# Encoded password with http://www.motobit.com/util/base64-decoder-encoder.asp
export VNC_PASSWORD="dm5jX3Bhc3M=" # vnc_password (a character limit is enforced?)
# Sadly many common VNC clients don't support encryption.
export USE_ENCRYPTION=false  # alternatively "true"

# Set a bunch of useful defaults. (for remote support cases.)
gsettings reset org.gnome.Vino network-interface
gsettings set org.gnome.Vino enabled true
gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino notify-on-connect true
gsettings set org.gnome.Vino require-encryption ${USE_ENCRYPTION}
gsettings set org.gnome.Vino vnc-password "${VNC_PASSWORD}"

# List all current settings
for i in `gsettings list-keys org.gnome.Vino`; do
  echo $i `gsettings get org.gnome.Vino $i`;
done

# Run the server
/usr/lib/vino/vino-server
