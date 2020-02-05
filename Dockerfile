FROM debian:buster-slim
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
       python3-gst-1.0 \
       gir1.2-gstreamer-1.0 \
       gir1.2-gst-plugins-base-1.0 \
       gstreamer1.0-plugins-good \
       gstreamer1.0-plugins-ugly \
       gstreamer1.0-tools \
       gstreamer1.0-alsa \
       libffi-dev
RUN curl -k "https://apt.mopidy.com/mopidy.gpg" | apt-key add -
RUN curl -k "https://apt.mopidy.com/buster.list" > /etc/apt/sources.list.d/mopidy.list
RUN apt-get update && \
    apt-get install -y \
    mopidy 
RUN python3 -m pip install Mopidy-MPD
RUN python3 -m pip install Mopidy-Podcast
RUN python3 -m pip install --pre Mopidy-SomaFM
RUN python3 -m pip install Mopidy-SoundCloud
RUN python3 -m pip install Mopidy-TuneIn
RUN python3 -m pip install --pre Mopidy-YouTube
RUN python3 -m pip install Mopidy-Mobile
RUN python3 -m pip install Mopidy-MusicBox-Webclient
RUN python3 -m pip install Mopidy-Party
RUN mkdir -p /data/music
EXPOSE 6680 6600
CMD ["/usr/local/bin/mopidy"]
