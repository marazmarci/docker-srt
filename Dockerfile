FROM debian:stable-slim

RUN apt-get update -y && \
    apt-get install git tclsh pkg-config cmake libssl-dev build-essential -y && \
    mkdir -p /root/srt_sources && \
    cd /root/srt_sources && \
    git clone --depth 1 https://github.com/Haivision/srt.git && \
    cd /root/srt_sources/srt && \
    ./configure && \
    make && \
    apt-get clean

ENTRYPOINT ["/root/srt_sources/srt/srt-live-transmit"]
