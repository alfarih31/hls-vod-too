FROM ghcr.io/linuxserver/ffmpeg:bin as binstage
FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# Add files from binstage
COPY --from=binstage / /

COPY install-ffmpeg-support.sh .
RUN chmod +x install-ffmpeg-support.sh
RUN ./install-ffmpeg-support.sh

ENV WORKDIR /var/app
WORKDIR /var/app

COPY install-node.sh .
RUN chmod +x install-node.sh
RUN /var/app/install-node.sh

COPY package.json .
RUN npm i

COPY . .

RUN npm run build

RUN mkdir /var/app/data
RUN mkdir /var/app/cache

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/var/app/entrypoint.sh"]
