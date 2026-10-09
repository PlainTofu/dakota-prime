FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:2fe16ba9b865bf35dabc396f23222e1902b5fa309f5fa1dd335f8b8a9ecfe165

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
