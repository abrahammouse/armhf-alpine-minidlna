## MiniDLNA

MiniDLNA is a simple media server software, with the aim of being fully compliant with DLNA/UPnP-AV clients.

## MiniDLNA Docker Images

This image is based on Alpine Linux.

### Usage

Example:

    docker run -d --name minidlna \
      --net=host \
      -p 8200:8200 \
      -p 1900:1900/udp \
      -v <PATH_TO_MUSIC_DIR>:/opt/Music \
      -v <PATH_TO_VIDEOS_DIR>:/opt/Videos \
      -v <PATH_TO_PICUTRES_DIR>:/opt/Pictures \
      geekduck/minidlna


If you want to overwrite a config file:

    docker run -d --name minidlna \
      --net=host \
      -p 8200:8200 \
      -p 1900:1900/udp \
      -v <PATH_TO_MUSIC_DIR>:/opt/Music \
      -v <PATH_TO_VIDEOS_DIR>:/opt/Videos \
      -v <PATH_TO_PICUTRES_DIR>:/opt/Pictures \
      -v <PATH_TO_CONFIG_DIR>/minidlna.conf:/etc/minidlna.conf \
      geekduck/minidlna

### Problems when build from armhf-alpine

##### 1. Can't find the package: minidlna

  Check [Build Log](http://build.alpinelinux.org/buildlogs/build-edge-armhf/community/minidlna/minidlna-1.1.5-r3.log)

##### 2. Entrypoint should be changed

  Previous entrypoint is `/usr/sbin/minidlnad -d`
  After make install, the entrypoint should be changed to `/usr/local/sbin/minidlnad -d`
