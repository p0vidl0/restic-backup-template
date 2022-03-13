# Restic backup template

## Motivation
Setting up and configuring the backup mechanism is quite a frequent task. 
And I want to get the agile solution that will take a short time to set up and will be robust.

## Restic
The [Restic](https://github.com/restic/restic) is the mature open-source tool with nice [documentation](https://restic.net).
Restic is easy to use, fast, supports many backends to store backup data and incremental approach that reduce the backup size.

## Alternatives
In the past, I have used a custom shell-script to make and rotate backups with GPG-encryption and Webdav or S3 storage linked to the filesystem via a fuse.
This solution have worked many time but was not reliable because of unstability of fuse.

## Restic-based solution
This template allows to easily configure backup for files and dockerized PostgreSQL/MariaDB.

### Step 1. Prepare Restic 

1. Install the Restic cli tool: just follow [official documentation](https://restic.readthedocs.io/en/stable/020_installation.html)
2. Prepare storage backend: create S3-compatible storage with your best provider as it described in [documentation](https://restic.readthedocs.io/en/stable/030_preparing_a_new_repo.html#amazon-s3)
3. Create `/etc/restic/restic.env` file and fill all variables with respective values
4. ...TBD

### Step 2. Files backup configuration
TBD

### Step 2. Postgres backup configuration
TBD

### Step 2. MariaDB backup configuration
TBD

> usermod -aG docker restic
> GRANT LOCK TABLES, SELECT, EVENT ON *.* TO 'BACKUP_USER'@'%' IDENTIFIED BY 'BACKUP_PASSWORD';

## Credit
* Thanks Restic team for the great product
* Thanks [tdemin](https://habr.com/ru/users/tdemin/) for his [manual](https://habr.com/ru/post/540096)
* Thanks https://github.com/ZettaIO/restic-compose-backup, https://github.com/ixc/restic-pg-dump-docker and 
  https://github.com/techknowlogick/restic-mysqldump-docker for inspiration


