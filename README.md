# NOTE FOR FUTURE SELF - THIS IS STILL WIP

## Overview
- Project for transforming my homeserver with IaC - Ansible, Tofu, and eventually Packer
- Completed the ansible part, now I'll move on to Tofu
- Recreating services I currently have in my proxmox server with IaC for future maintainability 

## ANSIBLE
### Status
- Completed the ansible part, playbook sets up 4 services:
1. **Calibre-web:**
  . installed as python venv with default options inside
    a debian 13 lxc container, docs
    at [https://github.com/janeczku/calibre-web/wiki/Manual-installation](https://github.com/janeczku/calibre-web/wiki/Manual-installation)
  . service exposed on port 8083
2. **Trilium:**
  - installed via source binaries and default options in
    debian 13 lxc container;
  - it  exposes the service on port 8080
  - docs at [https://docs.triliumnotes.org/user-guide/setup/server/installation/manual](https://docs.triliumnotes.org/user-guide/setup/server/installation/manual)
3. **Nextcloud:**
  - installed in debian lxc container; after the installation
    user is redirected to web gui wizard for setup.
  - **necessary to modify db password and user, in var secrets file**
  - setup as virtual image (no directory)
4. **Immich:**
  - installed in a debian 13 vm as a docker container; docs at
    [https://docs.immich.app/install/docker-compose](https://docs.immich.app/install/docker-compose)
  - service on port 2283 
### Tree structure
.
├── files/                      # Static files deployed by Ansible
│   └── immich/
│       └── docker-compose.yml  # Docker Compose configuration for Immich
├── inventory.ini               # Ansible inventory defining target hosts
├── playbook.yml                # Main entry point playbook for orchestration
├── README.md                   # Ansible part documentation
├── tasks/                      # Modular task files included by the playbook
│   ├── calibre-web.yml         # Tasks for Calibre-Web setup
│   ├── immich.yml              # Tasks for Immich setup
│   ├── nextcloud.yml           # Tasks for Nextcloud setup
│   └── trilium.yml             # Tasks for Trilium setup
├── templates/                  # Jinja2 template files for dynamic configuration
│   ├── calibre-web/
│   │   └── calibre-web.service.j2
│   ├── nextcloud/
│   │   ├── 99-nextcloud.ini.j2
│   │   └── nextcloud.conf.j2
│   └── trilium/
│       └── trilium.service.j2
└── vars/                       # Variable and secrets files
    ├── calibre-web_vars.yml    # Configuration variables for Calibre-Web
    ├── immich_vars.yml         # Configuration variables for Immich
    ├── nextcloud_secrets.yml   # Sensitive credentials for Nextcloud
    ├── nextcloud_vars.yml      # Configuration variables for Nextcloud
    └── trilium_vars.yml        # Configuration variables for Trilium

## TOFU
### Status
For now just testing stuff, will be changed
