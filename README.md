# docker-mopidy
Run mopidy plus various extensions in a docker container
* This is the development Branch

- Mopidy
- Mopidy-ALSAMixer
- Mopidy-Yamaha
- Mopidy-Spotify
- Mopidy-Somafm
- Mopidy-Soundcloud
- Mopidy-Bigbeet
- Mopidy-Mobile
- Mopidy-Iris

Build
=====

for Raspberry Pi, Odroid etc.

	docker build -t rawdlite/mopidy -f Dockerfile.armhf .

for x86 architecture
    
        docker build -t rawdlite/mopidy .

RUN
===
 
	docker run -d  --name mopidy --net host --device /dev/snd  \
		-v ~/.config:/root/.config  \
		-v /data/music:/data/music rawdlite/mopidy 

