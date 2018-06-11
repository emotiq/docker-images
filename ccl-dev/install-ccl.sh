#!/usr/bin/env bash

version=${CCL_VERSION:-1.11.5}

CCL_TAR_LINUX=https://github.com/Clozure/ccl/releases/download/v${version}/ccl-${version}-linuxx86.tar.gz

apt-get update && apt-get install -y \
  autoconf \
  build-essential \
  libcurl3-dev \
  libglib2.0-0 \
  curl \
  git-core \
  openssl \
  pgpgpg \
  gcc \
  make \
  g++ \
  gpgv2 \
  flex \
  bison \
  vim-nox \
  awscli \
  wget \
&& rm -rf /var/lib/apt/lists/*

(cd /usr/local && \
  curl -L $CCL_TAR_LINUX | tar xvfz - && \
  ln -s /usr/local/ccl/lx86cl64 /usr/local/bin/ccl)

echo "Installing Quicklisp"
wget -O /tmp/quicklisp.lisp https://beta.quicklisp.org/quicklisp.lisp \
  && ccl -l /tmp/quicklisp.lisp -e '(quicklisp-quickstart:install)' \
  && rm /tmp/quicklisp.lisp

rcfile="$HOME/.ccl-init.lisp"

cat >$rcfile <<EOF
  ;;; The following lines added by ql:add-to-init-file:
  #-quicklisp
  (let ((quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
    (when (probe-file quicklisp-init)
      (load quicklisp-init)))
EOF
