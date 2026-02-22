#!/bin/sh
set -e

# --- 1. Database Updates ---
# Both Fedora and Mint use these commands, but locations can vary.
# We use '|| true' so the installer doesn't crash if a tool is missing.

echo "Updating desktop and icon databases..."

if command -v update-desktop-database > /dev/null 2>&1; then
    update-desktop-database -q /usr/share/applications || true
fi

if command -v gtk-update-icon-cache > /dev/null 2>&1; then
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor || true
fi

if command -v update-mime-database > /dev/null 2>&1; then
    update-mime-database /usr/share/mime || true
fi

# --- 2. Environment Specific Refresh ---
# Fedora KDE uses 'kbuildsycoca6' to refresh the menu,
# while Mint Cinnamon uses the 'move' trick you wrote.

DESKTOP_FILE="/usr/share/applications/qtqmlprojcalc.desktop"

if [ -f "$DESKTOP_FILE" ]; then
    # The "Dummy Move" (Crucial for Cinnamon/Mint)
    mv "$DESKTOP_FILE" "${DESKTOP_FILE}.tmp"
    mv "${DESKTOP_FILE}.tmp" "$DESKTOP_FILE"

    # Fedora KDE Refresh (if applicable)
    if command -v kbuildsycoca6 > /dev/null 2>&1; then
        # Run as the current user if possible, or just skip
        kbuildsycoca6 --noincremental > /dev/null 2>&1 || true
    fi
fi

exit 0
