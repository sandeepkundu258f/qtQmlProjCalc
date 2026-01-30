#!/bin/sh
set -e

# 1. Update the standard caches
gtk-update-icon-cache -f -t /usr/share/icons/hicolor || true
update-desktop-database /usr/share/applications || true

# 2. Force a refresh of the system menu cache (The missing link)
if [ -x /usr/bin/update-menus ]; then
    /usr/bin/update-menus || true
fi

# 3. Clear the specific thumbnail cache for the current user
if [ -z "$SUDO_USER" ]; then
    SUDO_USER=$(whoami)
fi
rm -rf /home/$SUDO_USER/.cache/thumbnails/normal/* || true

exit 0
