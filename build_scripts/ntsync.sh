#!/bin/bash
# Ensures the ntsync kernel module loads automatically at boot.
# ntsync improves Wine/Proton performance for Windows games.
# The module is already in the kernel (6.14+) — this just auto-loads it.

set -euo pipefail

echo "==> Enabling ntsync module autoload..."

install -d /usr/lib/modules-load.d
echo "ntsync" > /usr/lib/modules-load.d/ntsync.conf

echo "==> ntsync will load automatically on next boot."
