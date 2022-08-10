#! /bin/bash

DEBIAN_FRONTEND="noninteractive"

LIBVA_DRIVERS_PATH="/usr/lib/x86_64-linux-gnu/dri"
NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"
NVIDIA_VISIBLE_DEVICES="all"

apt-get update && \
    apt-get install -y \
    i965-va-driver \
    libexpat1 \
    libgl1-mesa-dri \
    libglib2.0-0 \
    libgomp1 \
    libharfbuzz0b \
    libv4l-0 \
    libx11-6 \
    libxcb1 \
    libxcb-shape0 \
    libxcb-xfixes0 \
    libxext6 \
    libxml2 \
    ocl-icd-libopencl1 && \
  rm -rf \
    /var/tmp/*
