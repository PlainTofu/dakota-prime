FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:9e95f85dd2317f21457078874dd362463ec4897d53e44b973e181624e7312d3b

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
