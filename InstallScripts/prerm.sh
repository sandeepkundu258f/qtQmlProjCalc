#!/bin/sh
set -e

echo "Cleaning up desktop and icon databases..."

# Update databases to realize the files are gone
if command -v update-desktop-database > /dev/null 2>&1; then
    update-desktop-database -q /usr/share/applications || true
fi

if command -v gtk-update-icon-cache > /dev/null 2>&1; then
    gtk-update-icon-cache -f -t /usr/share/icons/hicolor || true
fi

# Specifically for Fedora KDE
if command -v kbuildsycoca6 > /dev/null 2>&1; then
    kbuildsycoca6 --noincremental > /dev/null 2>&1 || true
fi

exit 0
