FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:6e07ca27782d661d772f614b738327d859602a345f712eec809239895e6c66c1

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
