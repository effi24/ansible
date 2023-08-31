# Ansible Role: User and Group Management
Overview
This Ansible role streamlines the management of users and groups on a Debian-based system (Ubuntu). The role includes tasks to update the system, create primary and secondary groups, create users, assign authorized SSH keys, and configure user properties.

Tasks

1. DEBIAN | Install Update
   This task updates the package repository and installs the latest updates using the apt module. It executes only on Debian-based systems (Ubuntu) and is conditioned by the ansible_os_family variable.

2. Create Server User Primary Groups
   This task creates primary groups for server users. It utilizes the group module and iterates through the server_users list. The primary group name defaults to the user's name. The task respects the state attribute to determine group creation.

3. Assemble a List of Secondary Groups
   This task compiles a list of secondary groups for server users. It sets the \_server_users_secondary_groups variable by iterating through the server_users list. The task considers the groups attribute for each user, accumulating secondary group names.

4. Create Secondary Groups
   This task creates secondary groups for server users. It employs the group module to create groups based on the \_server_users_secondary_groups variable. It respects group names from the list and handles non-empty values.

5. Create Server Users
   This task creates server users based on the provided configuration. It employs the user module to set user attributes such as username, password, group membership, SSH key generation, shell, home directory, and more. The task iterates through the server_users list, considering attributes such as state, remove, group, groups, generate_ssh_key, and others.

6. Set Authorized Keys per User
   This task configures authorized SSH keys for server users. It uses the authorized_key module to assign authorized keys to each user. The task iterates through the server_users list and respects the auth_keys attribute for each user. It ensures exclusivity of keys and executes when the user's state is set to 'present'.

Usage
To utilize this Ansible role, include it in your playbook and customize variables as required:

```
server_users:
  - name: "alice"
    password: "alice_password"
    group: "sudo"
    groups:
      - "developers"
  - name: "bob"
    password: "bob_password"
    shell: "/bin/ksh"
    ssh_key_generate: no    
```
