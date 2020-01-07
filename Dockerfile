FROM ubuntu:19.10
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
       build-essential \
       gettext \
       wget \
       gnupg2
RUN wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list
RUN apt-get update && \
    apt-get install -y \
    mopidy \
    mopidy-local \
    mopidy-local-sqlite \
    mopidy-mpd \
    mopidy-podcast \
    mopidy-podcast-itunes \
    mopidy-scrobbler \
    mopidy-somafm \
    mopidy-soundcloud \
    mopidy-spotify \
    mopidy-tunein
RUN mkdir -p /data/music
EXPOSE 6680 6600
CMD ["/usr/bin/mopidy"]
