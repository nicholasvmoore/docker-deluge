Deluge Docker Container
===

# Deluge Configuration
The configuration files for deluge are located in a Volume that can be mounted to the container. 

# Deluge-web default password
Welcome!

## Volumes
- /config # This is where the flexget configuration YML should be mapped
- /watch  # This is where the torrent files will be placed upon retrieval
- /downloads # This is where the downloads for the torrents will be placed when completed

# SystemD unit file template
Symlink example
```bash
ln -s /etc/systemd/system/multi-user.target.wants/flexget@comics.service /opt/git/docker-flexget/flexget@.service
```

# Build from Dockerfile
```bash
git clone https://github.com/nicholasvmoore/docker-plex.git
docker build -t deluge $PWD/docke-plex/.
```

# Example Usage
```bash
docker run -v /opt/deluge:/config -v /opt/torrents/watch:/watch -v /home/nicholas/downloads:/downloads --name"nicholas-deluge" nicholasvmoore/docker-deluge 
```
