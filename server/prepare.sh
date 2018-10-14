#!/usr/bin/env bash

# Add terraria user
sudo useradd -r -m -d /srv/terraria terraria

# Allow port 7777 in firewall
sudo ufw allow 7777/tcp
sudo ufw enable

# Now you should download terraria server and put it in /opt/terraria
# Then run: sudo chown -R root:root /opt/terraria
# And move all the files to their directories
# https://www.linode.com/docs/game-servers/host-a-terraria-server-on-your-linode/
