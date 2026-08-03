FROM ghcr.io/projectbluefin/dakota-gaming:stable

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

# NTsync module
COPY build_scripts/ntsync.sh /tmp/ntsync.sh
RUN bash /tmp/ntsync.sh

# Steam udev rules (latest from upstream)
COPY build_scripts/steam-udev-rules.sh /tmp/steam-udev-rules.sh
RUN bash /tmp/steam-udev-rules.sh

RUN bootc container lint || true
