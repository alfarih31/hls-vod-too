#! /bin/bash

DEBIAN_FRONTEND="noninteractive"


apt-get update && \
  apt-get install -y \
    libexpat1 \
    libfontconfig1 \
    libglib2.0-0 \
    libgomp1 \
    libharfbuzz0b \
    libv4l-0 \
    libx11-6 \
    libxcb1 \
    libxext6 \
    libxml2 && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/*
