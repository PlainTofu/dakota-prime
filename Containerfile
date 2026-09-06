FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:765d25e04c883d8904e5f2155accda419be430b3ede583843e4e11811a4bf512

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
