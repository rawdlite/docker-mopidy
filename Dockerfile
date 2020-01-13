FROM ubuntu:14.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --force-yes \
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
        unzip \
        wget
RUN pip install -U  Mopidy
RUN pip install -U Mopidy-ALSAMixer
RUN pip install Mopidy-Yamaha
RUN wget -q -O - http://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN echo "deb http://apt.mopidy.com/ stable main contrib non-free" > /etc/apt/sources.list.d/mopidy.list
RUN echo "deb-src http://apt.mopidy.com/ stable main contrib non-free" >> /etc/apt/sources.list.d/mopidy.list
RUN apt-get install -y --force-yes apt-transport-https
RUN apt-get update && \
    apt-get install -y libspotify12 libspotify-dev \
    libffi-dev libffi6
RUN pip install Mopidy-Spotify
RUN pip install Mopidy-Somafm
RUN pip install Mopidy-Soundcloud
RUN pip install beets
RUN pip install Mopidy-BeetsLocal
RUN pip install Mopidy-Mobile
RUN pip install Mopidy-MusicBox-Webclient
RUN pip install Mopidy-Tachikoma
EXPOSE 6680 6600
CMD ["/usr/local/bin/mopidy"]

