# docker-mopidy
Run mopidy plus various extensions in a docker container
The image plays bitperfect using alsa devices.
Pulseaudio is not needed.
 
Plugins
=======

- Mopidy-Local
- Mopidy-Mpd
- Mopidy-Podcast
- Mopidy-Podcast-Itunes
- Mopidy-ALSAMixer
- Mopidy-Scrobbler
- Mopidy-Spotify
- Mopidy-Somafm
- Mopidy-Soundcloud
- Mopidy-Tunein


To be extended

RUN
===

        docker run -d  --name mopidy --net host --device /dev/snd  \
                -v ~/.config:/root/.config  \
                -v /data/music:/data/music rawdlite/mopidy

Buildx
======

Using buildx, it is possible to build a multi-platform image that runs on Raspberry Pi, Odroid etc. (armv7)
as well as on x86 architecture (amd64)

docker buildx build --platform linux/amd64,linux/arm/v7 --push -t rawdlite/mopidy:latest .

Docker picks the correct image based on the node’s platform
