FROM ubuntu:xenial
MAINTAINER Eugene Chupriyanov <eugene@emotiq.ch>

RUN apt-get update && apt-get install -y \
  autoconf \
  bison \
  build-essential \
  curl \
  ed \
  flex \
  g++ \
  gcc \
  git-core \
  make \
  openssl \
  pgpgpg \
  sudo \
  wget

RUN (cd /tmp && \
  curl -L https://github.com/aktau/github-release/releases/download/v0.7.2/linux-amd64-github-release.tar.bz2 | tar xvfj - && \
  mv bin/linux/amd64/github-release /usr/local/bin \
  )
