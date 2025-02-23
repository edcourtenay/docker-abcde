FROM debian:trixie-slim AS export

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

ENTRYPOINT [ "abcde" ]