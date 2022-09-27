FROM debian:stable-slim

RUN apt-get update -y

RUN apt-get install git tclsh pkg-config cmake libssl-dev build-essential -y

RUN mkdir -p /root/srt_sources && \
  cd /root/srt_sources && \
  git clone --depth 1 https://github.com/Haivision/srt.git && \
  cd /root/srt_sources/srt && \
  ./configure && \
  make

RUN apt-get clean

ENTRYPOINT ["/root/srt_sources/srt/stransmit"]
