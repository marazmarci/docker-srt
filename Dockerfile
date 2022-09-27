FROM debian:stable-slim

RUN apt-get update -y && \
    apt-get install -y git tclsh pkg-config cmake libssl-dev build-essential && \
    git clone --depth 1 https://github.com/Haivision/srt.git && \
    cd /root/srt && \
    ./configure && \
    make install && \
    apt-get clean

ENTRYPOINT ["/usr/local/bin/srt-live-transmit"]
