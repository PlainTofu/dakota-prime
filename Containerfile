FROM ghcr.io/projectbluefin/dakota-gaming:stable

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
