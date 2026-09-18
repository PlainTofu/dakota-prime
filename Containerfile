FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:95ca6a7a3a1d79b5f7177ff7e5371873613762d6e6931fca99c5220916ea0327

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
