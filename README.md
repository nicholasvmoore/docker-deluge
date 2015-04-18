Deluge Docker Container
===

# Deluge Configuration
The configuration files for deluge are located in a Volume that can be mounted to the container. 

# Deluge-web default password
Welcome!

## Volumes
- /config # This is where the deluge config should be stored
- /watch  # This is where the torrent files will be placed upon retrieval
- /downloads # This is where the downloads for the torrents will be placed when completed

# SystemD unit template
The template assumes the instance is a user on the machine and is added to the docker group.

|Specifier|Usage|
|---|---|
|**%i**|Used to name the docker container <br /> Used to specify the $HOMEDIR of the user where the configuration files, torrent files and downloads are placed <br /> Used to specify the user who will run the container |
|**%u**|Specified by **%i**| 
## Volume mappings


### Symlink example
```bash
ln -s /etc/systemd/system/multi-user.target.wants/deluge@user.service /opt/git/docker-deluge/deluge@.service
```

# Build from Dockerfile
```bash
git clone https://github.com/nicholasvmoore/docker-deluge.git
docker build -t deluge $PWD/docker-deluge/.
```

# Example Usage
```bash
docker run -v /opt/deluge:/config -v /opt/torrents/watch:/watch -v /home/nicholas/downloads:/downloads --name"nicholas-deluge" -p 8112:8112 -p 53160-53168:53160-53168/tcp -p 53160-53168:53160-53168/udp nicholasvmoore/docker-deluge 
```
