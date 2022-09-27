FROM debian:stable-slim

RUN buildDependencies="git tclsh pkg-config cmake libssl-dev build-essential" && \
    apt-get update -y && \
    apt-get install -y $buildDependencies && \
    git clone --depth 1 https://github.com/Haivision/srt.git && \
    cd /root/srt && \
    ./configure && \
    make install && \
    apt-get purge -y --auto-remove $buildDependencies && \
    apt-get clean

ENTRYPOINT ["/usr/local/bin/srt-live-transmit"]
