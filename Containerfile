FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:f05568232701da84995d4fdc3c87780d1b9d0fa2bf048232b32e61975abd0ce0

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
