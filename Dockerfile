FROM ubuntu:20.04

ENV LIBVIPS_VERSION_MAJOR=8 LIBVIPS_VERSION_MINOR=12 LIBVIPS_VERSION_PATCH=2
ENV LIBVIPS_VERSION=$LIBVIPS_VERSION_MAJOR.$LIBVIPS_VERSION_MINOR.$LIBVIPS_VERSION_PATCH

RUN \
  # Install dependencies
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
  automake build-essential curl \
  gobject-introspection gtk-doc-tools libglib2.0-dev libpng-dev \
  libjpeg-turbo8-dev \
  libwebp-dev libtiff5-dev libgif-dev libexif-dev libxml2-dev libpoppler-glib-dev \
  swig libpango1.0-dev libmatio-dev libopenslide-dev libcfitsio-dev \
  libgsf-1-dev fftw3-dev liborc-0.4-dev librsvg2-dev libimagequant-dev && \
  # If you want to use libmagick (but not working with static): libmagickcore-dev libmagickwand-dev && \
  #
  # Build libvips
  cd /tmp && \
  curl -L https://github.com/libvips/libvips/releases/download/v$LIBVIPS_VERSION/vips-$LIBVIPS_VERSION.tar.gz > vips-$LIBVIPS_VERSION.tar.gz && \
  tar xf vips-$LIBVIPS_VERSION.tar.gz && \
  cd vips-$LIBVIPS_VERSION && \
  ./configure --enable-debug=no --without-python --without-magick && \
  make && make install && ldconfig && \
  #
  # Clean up
  apt-get remove -y curl automake build-essential && \
  apt-get autoremove -y && \
  apt-get autoclean && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
