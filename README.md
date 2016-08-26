# docker-mopidy
Run mopidy plus various extensions in a docker container

- Mopidy
- Mopidy-ALSAMixer
- Mopidy-Yamaha
- Mopidy-Spotify
- Mopidy-Somafm
- Mopidy-Soundcloud
- Mopidy-BeetsLocal
- Mopidy-Mobile

Build
=====

cd into the directory of your architecture.

	docker build -t rawdlite/mopidy .

RUN
===
 
	docker run -d  --name mopidy --net host --device /dev/snd  \
		-v ~/.config/mopidy/mopidy.conf:/root/.config/mopidy/mopidy.conf  \
		-v /data/music:/data/music rawdlite/mopidy 

