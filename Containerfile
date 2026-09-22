FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:e0670ab927e6762e175a73a1ed47b54215163170a5efe407472640c1ac9951ea

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
