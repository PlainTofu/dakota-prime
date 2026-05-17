#!/bin/bash
# Installs the latest Steam udev rules from Valve's upstream repository.
#
# These rules grant Steam (and SteamVR) the device permissions needed
# for controllers (Steam Controller, Steam Deck controls, third-party
# gamepads), HMDs, and base stations to work without root privileges.
#
# Pulling straight from upstream ensures support for the newest hardware
# Valve has added rules for, which often lags behind the version shipped
# with the steam package on Fedora.

set -euo pipefail

REPO="ValveSoftware/steam-devices"
BRANCH="master"
DEST="/usr/lib/udev/rules.d"
TARBALL_URL="https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz"

echo "==> Downloading latest Steam udev rules from ${REPO}..."

# Work in a temp dir so we can extract the tarball without polluting /tmp
# with intermediate files. The trap cleans up even if something fails.
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

curl -fsSL "$TARBALL_URL" | tar -xz -C "$TMPDIR" --strip-components=1

# /usr/lib/udev/rules.d is the correct location for image-baked rules on
# a bootc/composefs system like Dakota — /etc is reserved for host-local
# overrides, while /usr is the immutable image content.
install -d "$DEST"

# Glob every .rules file rather than hard-coding filenames, so if Valve
# adds new hardware rules upstream they're picked up on the next build
# without having to touch this script.
shopt -s nullglob
RULES_FILES=("$TMPDIR"/*.rules)

if [ ${#RULES_FILES[@]} -eq 0 ]; then
    echo "ERROR: No .rules files found in ${REPO} tarball." >&2
    exit 1
fi

for rule in "${RULES_FILES[@]}"; do
    install -m 0644 "$rule" "$DEST/"
    echo "    Installed $(basename "$rule")"
done

echo "==> Steam udev rules installed to ${DEST}."
