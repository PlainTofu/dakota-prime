FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:ef40f33b57fb7876ad336f4c0973b3cd01675df6173035497eb090989fb34ffb

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
