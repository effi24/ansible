# Ansible Role: Exporter Installation and Configuration
This Ansible role automates the installation and configuration of Prometheus exporters for MySQL and node metrics. It sets up the mysqld_exporter and node_exporter services on a Debian-based system (Ubuntu) and ensures their proper configuration.

## Requirements
Ansible 2.9+
Debian-based system (Ubuntu)
Systemd as the init system
Role Variables
This role provides several variables that you can customize to control the behavior of the role. These variables can be set in your playbook or inventory files.

## Role Variables
This role provides several variables that you can customize to control the behavior of the role. These variables can be set in your playbook or inventory files.

 * _exporter_system_user: The system user for the exporter services.
 * _exporter_system_group: The system group for the exporter services.
 * _exporter_binary_install_dir: The directory where exporter binaries will be installed.
 * _mysqld_exporter_db_user: The MySQL exporter user.
 * mysqld_exporter_version: The version of mysqld_exporter to install.
 * node_exporter_version: The version of node_exporter to install.
 * go_arch: The target architecture for the exporter binaries.
 * node_exporter_textfile_dir: The directory for node_exporter's textfile collector.

## Tasks
The role includes tasks for installing and configuring both mysqld_exporter and node_exporter. It ensures proper setup of the user, configuration files, and services.

Handlers
restart mysqld_exporter
This handler restarts the mysqld_exporter service to apply configuration changes.

restart node_exporter
This handler restarts the node_exporter service to apply configuration changes.