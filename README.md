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

# SystemD unit file template
The unit file will use the %i variable as the username to store the files, it assumes this user exists on the machine. For example, deluge@user.service maps the /downloads volume to /home/user/downloads.

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
