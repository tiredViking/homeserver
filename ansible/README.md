## Trilium
- Installed from binaries to lxc container
- templates/trilium contains the systemd unit for trilium
## Immich
- Installed on debian1 13 VM, Immich runs inside a **Docker container**
-  Docker gets executed as normal user, that gets created and added to docker group
- .env and Dockerfile files are under *files/immich*; **.env will have to be modified** to map the data directory of immich to the external hard disk, and for **passwords**
## Calibre-web
- Installed as python venv
- calibre-web/calibre-web.service.j2 contains the systemd unit for calibre web
## Nextcloud
- Installed on debian13 trixie
- Installed from source tar ball
- Password for the db are generated with ```ansible-vault create ansible/vars/nextcloud_secrets.yml```
- templates/nextcloud contains the following:
    - *99-nextcloud.ini.j2*: this is the INI configuration for PHP
    - *nextcloud.conf*: apache web server configuration (configured  as virtual host)
- the playbook sets up nextcloud; after the playbook runs, connect to *http://<server_ip>/nextcloud*:wa
