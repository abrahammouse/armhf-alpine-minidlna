FROM container4armhf/armhf-alpine:latest
MAINTAINER Abrahammouse <abrahammouse@gmail.com>

# install minidlna
RUN apk add --no-cache wget build-base bsd-compat-headers libvorbis-dev libogg-dev libid3tag-dev libexif-dev libjpeg-turbo-dev sqlite-dev ffmpeg-dev flac-dev \
  && mkdir /downloads \
  && cd /downloads \
  && wget https://gitlab.com/kent119/minidlna/raw/b454c68384f2a8f62a07b1b70a77636b37591e52/minidlna-1.1.5.tar.gz --no-check-certificate \
  && tar xzf minidlna-1.1.5.tar.gz \
  && cd /downloads/minidlna-1.1.5 \
  && ./configure \
  && make \
  && make install \
  && cd / \
  && rm -rf /downloads/minidlna-1.1.5 \
  && apk del wget build-base bsd-compat-headers

# Add config file
RUN mkdir /opt/Music -p \
  && mkdir /opt/Videos -p \
  && mkdir /opt/Pictures -p \
COPY minidlna.conf /etc/minidlna.conf

EXPOSE 1900/udp
EXPOSE 8200

ENTRYPOINT [ "/usr/local/sbin/minidlnad", "-d" ]
