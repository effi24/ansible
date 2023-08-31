# Ansible Role: MySQL and Redis Setup
Overview
This Ansible role automates the setup and configuration of MySQL and Redis services on Ubuntu-based systems (Debian family). The role includes tasks to install MySQL and Redis, configure their settings, and set up permissions. Additionally, it installs Python packages for interacting with MySQL and Redis.

Tasks

1. Install MySQL 8 (Ubuntu)
   This task installs the MySQL server and its development libraries on the target system. It utilizes the apt module for package management. Installation occurs only on Debian-based systems (Ubuntu). After installation, the mysql restarted handler is triggered.

2. Configure MySQL
   This task applies the MySQL configuration template (mysqld.cnf.j2) to the system. The ansible.builtin.template module is used to copy the configuration file to /etc/mysql/mysql.conf.d/mysqld.cnf. The task validates the configuration using the MySQL validation tool and triggers the mysql restarted handler if the configuration changes.

3. Set Permissions on MySQL Socket Directory
   This task sets permissions (0777) on the MySQL socket directory (/var/run/mysqld) to allow proper access. It uses the ansible.builtin.file module to modify permissions recursively. Elevated privileges are required (become: true). The mysql restarted handler is triggered.

4. Set MySQL Root Password
   This task generates a random password for the MySQL root user using the ansible.builtin.set_fact module. The password is generated only if it's not already defined.

5. Setup my.cnf File for Root
   This task configures the MySQL configuration file (my.cnf) for the root user. The ansible.builtin.template module is used to populate the file with necessary details. The file is created at /root/.my.cnf with restricted permissions (0600). The task is registered (register: my_cnf) to capture configuration changes.

6. Install Python Packages
   This task installs python3-pip using the apt module, required for installing Python packages.

7. Install PyMySQL
   This task employs the pip module to install the Python package pymysql, which facilitates interaction with MySQL databases.

8. Configure MySQL Root Account
   This task configures the MySQL root account using the community.mysql.mysql_user module. It sets the root user's password, login socket, and plugin type. The previously generated root password and MySQL configuration file are used. The mysql restarted handler is triggered upon completion.

9. Install Redis
   This task installs the Redis server using the apt module. Installation occurs exclusively on Debian-based systems (Ubuntu). The redis restarted handler is triggered after installation.

Handlers
mysql restarted
This handler restarts the MySQL service to apply configuration changes.

redis restarted
This handler restarts the Redis service to apply configuration changes.
