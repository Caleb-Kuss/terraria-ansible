# Terraria Playbook

This Ansible project provides automation scripts and configurations for managing Terraria servers. It includes Bash scripts for server maintenance tasks, roles for configuring server worlds, and tasks for updating the Terraria server software. This playbook will work best if you use this book to control another server, otherwise you will have to make some modifications to the `update_server.sh` file. You would have to remove the line that `sleeps` and `reboots` the server if you choose too run the playbook from the terraria server.

## Directory Structure

```css
├── ansible.cfg
├── bash
│   ├── backup_worlds.sh
│   └── update_server.sh
├── inventory
├── README.md
├── roles
│   ├── World_One
│   │   ├── defaults
│   │   │   └── main.yml
│   │   ├── handlers
│   │   │   └── main.yml
│   │   ├── README.md
│   │   ├── tasks
│   │   │   └── main.yml
│   │   ├── templates
│   │   │   └── World_One_Config.txt.j2
│   │   └── vars
│   │       └── main.yml
│   └── World_Two
│       ├── defaults
│       │   └── main.yml
│       ├── handlers
│       │   └── main.yml
│       ├── README.md
│       ├── tasks
│       │   └── main.yml
│       ├── templates
│       │   └── World_Two_Config.txt.j2
│       └── vars
│           └── main.yml
├── tasks
│   ├── update_terraria.yml
│   ├── World-One_playbook.yml
│   └── World-Two-playbook.yml
└── vars
    └── update_vars.yml
```

## Usage

Update Variables:

Modify variables in the vars/update_vars.yml file to customize server configurations and update settings. Whenever there is an update to Terraria, come in here and update the vars to ensure your worlds get backed up, restarted, and updated to the latest version.

```yaml
latest_version: 1449
previous_version: 14481
latest_version_download_URL: https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip
```

**You Must**

Update this path `/<project-file-path>/` to the path where this playbook is located on your server/machine. Do a global search as this is located in 3 places which are `/roles/World_Two/tasks/main.yml`, `/roles/World_One/tasks/main.yml`, and `/bash/backup_worlds.sh`. Additionally, make sure you configure the inventory file to your specifications as well.

## Execute Playbooks:

Run Ansible playbooks to apply configurations and perform maintenance tasks on Terraria servers.

```bash
ansible-playbook -i inventory update_terraria.yml
```

This will update the server, move world backups to the new server location, save and kill the current server sessions, and spin up new server sessions. This will also create cron jobs on the server that will auto start your worlds if the server is rebooted, and backup your worlds daily at 0100 (24hr time) via the `backup_worlds.sh` file.

_It is important to remember you must first update the variables for this playbook to work correctly. Visit the `You Must` section if you have not already._

## Bash Scripts:

Use Bash scripts in the bash directory for server backup and update tasks.

```bash
./bash/backup_worlds.sh
./bash/update_server.sh
```

In the `backup_worlds.sh` file remember to update the source path. This file copies the world file to a backup world directory.

The `update_server.sh` file has a variable which is a list of worlds which it will iterate through to gracefully shut the worlds down before updating the server.

## Roles

World Roles:

world1: Role for configuring and managing World 1 server.
world2: Role for configuring and managing World 2 server.

## Tasks

update_terraria: Task for updating the Terraria server software.
World-One-playbook.yml: Runs the World_one role.
World-Two-playbook.yml: Runs the World_Two role.

## Disclosure

This project is provided as-is without any warranties. While efforts have been made to ensure its reliability and accuracy, the author cannot be held responsible for any damages or liabilities arising from the use of this project. Use it at your own risk.
