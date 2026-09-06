#!/bin/bash
# Enables AMD GPU Overdrive (overclocking) by baking the required kernel
# parameter into the image at build time.
#
# The amdgpu driver disables overclocking by default. Setting ppfeaturemask
# to 0xffffffff unlocks all overdrive features, which LACT (installed via
# Flatpak) then uses to let you control clocks, voltages, and fan curves.

set -euo pipefail

echo "==> Enabling AMD GPU overdrive kernel parameter..."

# Create the kargs.d directory if it doesn't exist.
# bootc reads files in /usr/lib/bootc/kargs.d/ and bakes them into the
# UKI kernel command line at build time — this is the correct place
# for kernel args in a composefs/UKI image like Dakota.
install -d /usr/lib/bootc/kargs.d

cat > /usr/lib/bootc/kargs.d/99-custom.toml << 'EOF'
# Enable AMD GPU Overdrive (overclocking support)
# Required by LACT and other AMD GPU tuning tools.
# Without this, the amdgpu driver blocks all clock/voltage changes.
[kargs]
append = ["amdgpu.ppfeaturemask=0xffffffff"]
EOF

echo "==> AMD overdrive kernel parameter enabled."
echo "    Install LACT via Flatpak after booting:"
echo "    flatpak install flathub io.github.ilya_zlobintsev.LACT"
