# Tasks

Install Nginx
This task uses the apt module to install the Nginx package on the target system. The installation occurs only on Debian-based systems (Ubuntu). After successful installation, the handler start_enable_nginx is triggered.

Handlers
Start and Enable Nginx
This handler starts the Nginx service and enables it to start on system boot.
