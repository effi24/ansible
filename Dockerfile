FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
# Install required packages
RUN echo 'root:root' | chpasswd
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y systemd systemd-sysv dbus dbus-user-session sudo vim ansible less git openssh-server

# Create the "ansible" user and set password
RUN useradd -m -s /bin/bash ansible && echo 'ansible:ansible' | chpasswd

# Grant sudo privileges to the "ansible" user
RUN echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible

# Start systemd on container startup
RUN printf "systemctl start systemd-logind" >> /etc/profile

# Set the entry point to systemd
ENTRYPOINT ["/sbin/init"]

