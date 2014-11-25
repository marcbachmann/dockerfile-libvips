FROM ubuntu:14.04
MAINTAINER Marc Bachmann <marc.brookman@gmail.com>

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  automake build-essential curl \
  gobject-introspection gtk-doc-tools libglib2.0-dev libjpeg-turbo8-dev libpng12-dev libwebp-dev libtiff5-dev libexif-dev libxml2-dev swig libmagickwand-dev

WORKDIR /tmp
RUN \
  curl -O http://www.vips.ecs.soton.ac.uk/supported/7.42/vips-7.42.0.tar.gz && \
  tar zvxf vips-7.42.0.tar.gz && \
  cd vips-7.42.0 && \
  ./configure --enable-debug=no --enable-docs=no --enable-cxx=yes --without-python --without-orc --without-fftw --without-gsf $1 && \
  make && \
  make install && \
  ldconfig

RUN apt-get remove -y curl automake build-essential && \
    apt-get autoremove -y && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
