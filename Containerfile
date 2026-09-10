FROM ghcr.io/projectbluefin/dakota-gaming:stable@sha256:64621ea1c41ef5fcd0d7dc17e638ea6b3e7a653a8a9cfe356105cf1e61af8d9a

# AMD overclocking
COPY build_scripts/amd-overclock.sh /tmp/amd-overclock.sh
RUN bash /tmp/amd-overclock.sh

RUN bootc container lint || true
