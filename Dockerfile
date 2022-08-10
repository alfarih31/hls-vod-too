FROM ghcr.io/linuxserver/ffmpeg:bin as binstage
FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# Add files from binstage
COPY --from=binstage / /

COPY install-ffmpeg-support.sh .
RUN chmod +x install-ffmpeg-support.sh
RUN ./install-ffmpeg-support.sh

ENV VOD_ROOT_PATH /var/app/data
ENV VOD_CACHE_PATH /var/app/cache
ENV VOD_PORT 4040

WORKDIR /var/app

COPY install-node.sh .
RUN chmod +x install-node.sh
RUN /var/app/install-node.sh

COPY package.json .
RUN npm i

COPY . .

RUN npm run build

RUN mkdir $VOD_ROOT_PATH
RUN mkdir $VOD_CACHE_PATH

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/var/app/entrypoint.sh"]

CMD ["node /var/app/hls-vod.js --ffmpeg-binary-dir /usr/local/bin --port ${VOD_PORT} --root-path ${VOD_ROOT_PATH} --cache-path ${VOD_CACHE_PATH}"]
