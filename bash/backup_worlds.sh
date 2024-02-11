#!/bin/bash

# Variables
source /<project-file-path>/vars/update_vars.yml

Terraria_Worlds="/opt/terraria/current/$latest_version/Linux/*.wld*"

# Terraria Worlds
for f in $Terraria_Worlds
do
  if [ -f "$f" ]
  then
    echo $(date +'%c')
    echo "Processing $f file..."
    cp -f "$f" /opt/terraria/backupworlds/
  else
    echo "Warning: Some problem with \"$f\""
  fi
done

