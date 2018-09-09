FROM ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        gettext \
        gir1.2-gstreamer-1.0 \
        gir1.2-gst-plugins-base-1.0 \
        git \
        gstreamer1.0-alsa \
        gstreamer1.0-libav \
        gstreamer1.0-plugins-good \
        gstreamer1.0-plugins-ugly \
        gstreamer1.0-tools \
        libasound2-dev \
        libssl-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        python-dev \
        python-pip \
        python-gst-1.0 \
        mysql-client \
        unzip \
        wget
RUN pip install -U  Mopidy
RUN pip install -U Mopidy-ALSAMixer
RUN pip install Mopidy-Yamaha
RUN pip install Mopidy-Gmusic
RUN wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN echo "deb http://apt.mopidy.com/ stable main contrib non-free" > /etc/apt/sources.list.d/mopidy.list
RUN echo "deb-src http://apt.mopidy.com/ stable main contrib non-free" >> /etc/apt/sources.list.d/mopidy.list
RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        libspotify12 \
        libspotify-dev \
        libffi-dev \
        libffi6
RUN pip install Mopidy-Spotify
RUN pip install Mopidy-Somafm
RUN pip install Mopidy-Soundcloud
RUN pip install beets
RUN pip install mysql-connector
RUN pip install Mopidy-BeetsLocal
RUN pip install Mopidy-Mobile
RUN pip install Mopidy-MusicBox-Webclient
RUN pip install Mopidy-Gmusic
RUN pip install Mopidy-Iris
RUN git clone https://github.com/rawdlite/mopidy-bigbeet.git && \
    cd mopidy-bigbeet && \
    pip install --editable .
RUN pip install peewee
RUN pip install --user https://github.com/rogerbinns/apsw/releases/download/3.24.0-r1/apsw-3.24.0-r1.zip \
--global-option=fetch --global-option=--version --global-option=3.24.0 --global-option=--all \
--global-option=build --global-option=--enable-all-extensions
RUN pip install uritools
RUN pip install flask
RUN pip install pylast==2.2.0
RUN pip install beets-copyartifacts
RUN pip install pyacoustid
COPY root /
RUN chmod +x *.sh
RUN mkdir -p /data/music
EXPOSE 6680 6600
CMD ["/usr/local/bin/mopidy", "--save-debug-log"]

