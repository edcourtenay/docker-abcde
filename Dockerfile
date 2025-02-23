FROM debian:trixie-slim AS export
ARG cdrom_gid
ARG uid=1000


RUN apt-get update \
    && apt-get install \
        abcde \
        cdparanoia \
        lame \
        eyed3 \
        eject \
        imagemagick \
        glyrc \
        normalize-audio \
        beep \
        flac \
        ffmpeg \
        mkcue \
        atomicparsley \
        -y \
    && apt-get clean

COPY abcde.conf /etc/abcde.conf

RUN useradd -m worker --uid ${uid} -G cdrom \
    && if [ -n "${cdrom_gid}" ]; then groupadd -f -g "${cdrom_gid}" cdrom \
    && usermod -a -G cdrom worker; fi \
    && mkdir -p /output \
    && chown worker: /output
VOLUME ["/output"]

ENTRYPOINT [ "abcde" ]