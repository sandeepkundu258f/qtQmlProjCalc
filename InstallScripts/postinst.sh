#!/bin/sh
set -e

# 1. Update the standard databases
update-desktop-database -q /usr/share/applications || true
gtk-update-icon-cache -f -t /usr/share/icons/hicolor || true

# 2. Update MIME database (Cinnamon watches this for menu changes)
if command -v update-mime-database > /dev/null 2>&1; then
    update-mime-database /usr/share/mime || true
fi

# 3. The "Dummy" File Move
# Sometimes Cinnamon ignores 'touch'. We will rename the file and move it back.
# This forces the kernel to send an 'IN_MOVED_TO' event which Cinnamon can't ignore.
DESKTOP_FILE="/usr/share/applications/qtqmlprojcalc.desktop"
if [ -f "$DESKTOP_FILE" ]; then
    mv "$DESKTOP_FILE" "${DESKTOP_FILE}.tmp"
    mv "${DESKTOP_FILE}.tmp" "$DESKTOP_FILE"
fi

exit 0
