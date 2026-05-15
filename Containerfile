FROM ghcr.io/projectbluefin/dakota:latest

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

# NTsync module
COPY build_scripts/ntsync.sh /tmp/ntsync.sh
RUN bash /tmp/ntsync.sh

RUN bootc container lint || true
