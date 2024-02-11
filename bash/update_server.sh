#!/bin/bash

# Variables

world_names=( World_Two World_One )

echo -e "\nGraceful shutdown of Terraria worlds and checking for updates on: `date +%F` at `date +%H%M`"

# Shut down Terraria Worlds

for i in "${world_names[@]}"
do
/usr/bin/screen -r $i -p 0 -X stuff 'exit^M'
echo "Shutting down the $i world"
done

echo 'Updating the server!'

apt update -y && apt upgrade -y

echo 'sleeping for 10 minutes'

sleep 10m

echo 'rebooting'

reboot

echo -e "_________________________________________________\n"