#!/bin/bash
deluge-web -c /config -f
deluged -d -c /config -L info
