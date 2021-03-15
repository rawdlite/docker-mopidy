FROM ubuntu:19.10
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
       build-essential \
       gettext \
       openssl \
       software-properties-common \
       apt-transport-https \
       curl \
       gnupg2 \
       python3 \
       python3-pip \
       gstreamer1.0-plugins-bad
RUN curl -k "https://apt.mopidy.com/mopidy.gpg" | apt-key add -
RUN curl -k "https://apt.mopidy.com/buster.list" > /etc/apt/sources.list.d/mopidy.list
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
RUN sudo python3 -m pip install Mopidy-Mobile

RUN mkdir -p /data/music
EXPOSE 6680 6600
CMD ["/usr/bin/mopidy"]
