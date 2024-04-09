# Clean install:

Stop postgresql service and check.

```
sudo service postgresql stop
sudo service postgresql status
```

This command will remove PostgreSQL and any associated configuration files from your system.

```
sudo apt purge postgresql-14 postgresql-client-14 postgresql-client-common postgresql-common
```

Verify Uninstallation

```
dpkg -l | grep postgresql
```

Remove Data Directory, User, and Group

```
sudo rm -rf /var/lib/postgresql
sudo rm -rf /etc/postgresql
sudo rm -rf /var/log/postgresql
sudo deluser postgres
sudo delgroup postgres

```

Fresh install

```
sudo apt update
sudo apt upgrade
sudo apt install postgresql postgresql-contrib
sudo service postgresql status
sudo chmod 755 /home/kod
```

Access postgres

```
sudo -u postgres psql
\password postgres
\q
```

Shortcuts:

```
\l  list
\q quit
\c connect
\d display

```
