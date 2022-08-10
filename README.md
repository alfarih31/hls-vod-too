hls-vod-too [![npm version](https://badge.fury.io/js/hls-vod-too.svg)](https://badge.fury.io/js/hls-vod-too)
=======

HTTP Live Streaming with on-the-fly encoding of any video file. Supports modern browsers through the use of [hls.js](https://github.com/video-dev/hls.js/).

Differences from the original [hls-vod-too](https://github.com/kmxz/hls-vod-too)
--------------------------------------------------------------------------------

1. Updated dependencies
2. Fix Typescript issues upon running & compiling
3. Added Dockerfile for deployment


Original [hls-vod-too docs](https://github.com/kmxz/hls-vod-too/blob/master/README.md)
-----------------------------------------------------------------

Docker
-----

## Build image
1. `x86-64` based system

```shell
docker build -t hls-vod:latest .
```

2. `aarch64` based system

```shell
docker build -t hls-vod:aarch64v8 -f Dockerfile.aarch64 .
```

## Run image

- The container need to mount following paths with corresponding args:
1. `--root-path`: `/var/app/data`
2. `--cache-path`: `/var/app/cache`

- The container by default run at `4040`

- To run the image you need to mount those paths & port such this:

```shell
export PORT=8080
export DATA=/www/data
export CACHE=/www/cache
docker run --rm -it -p ${PORT}:4040 -v ${DATA}:/var/app/data -v ${CACHE}:/var/app/cache hls-vod:latest
```
