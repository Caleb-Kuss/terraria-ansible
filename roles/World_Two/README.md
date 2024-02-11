# World_Two

This role is a baseline role that is meant to be ran by the `update_terraria.yml` task. The update task calls this role after the server has been updated to the latest Terraria version.

This role will ensure the latest `unzip` and `screen` packages are installed which are needed to download and run Terraria.
Once that task is completed it will then go ahead and config the world to the specified configuration.
After the configuration has been set, it will then start the world.

## Requirements

The below requirements can be modified if you so choose.

1. Your Ansible user must have `sudo` privileges
1. You will need a terraria user on the server
1. You must set the `dir` path for this playbook in the `tasks/main.yml` file

## Role Variables

The variables file contains the basic settings one would want for configuring their world. Below is a code example for this role:

```yaml
---
world: World_Two.wld

#creates a large world if one is not found
autocreate: 3

# sets the world seed
seed: AwesomeSeed

# setting the world name
worldname: World_Two

# difficulty 0(normal) 1(expert) 2(master) 3(journey)
difficulty: 2

# max players
maxplayers: 20

# Port to open
port: 7778

# server pass
password: Pas$w0rd

# Set AutoSave option
AutoSave: true

# message of the day
motd: "Hey! I'm a fresh new update!"

# path to the world locations
# change the user path top the new user created by ansible
worldpath: /home/terraria/Documents/games/terraria/worlds/

# language
language: "en/US"

#Adds addition cheat protection.
secure: 1

#Reduces enemy skipping but increases bandwidth usage. The lower the number the less skipping will happen, but more data is sent. 0 is off.
npcstream: 60

#Sets the number of rolling world backups to keep
worldrollbackstokeep: 2
```

## Dependencies

The only dependency would be the root vars file which is why you must define the `dir` path. Do a global search for `/<project-file-path>/vars/` and replace it with the path to where you placed this playbook.
