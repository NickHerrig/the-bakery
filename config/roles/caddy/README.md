# Caddy Ansible Role
This grafana ansible role is responsbile for installing, configuring and upgrading
the grafana graphing application. Before reading the details of how this automation
works, it probably makes sense to gain familiarity with [the application](https://grafana.com/grafana/)

## Usage

More specifically this role:

  - configures users/groups
  - installs systemd dependencies
  - creates application directories
  - installs application using apt 
  - configures grafana datasources and admin user

### Adding a Datasource (TODO)
### Adding a User (TODO)
### Adding a Dashboard (TODO)

## Role Variables

### Sensible defaults
| Variable | Default | Description |
|----------|---------|-------------|
| grafana_admin_user | nebullam | The admin user for logging into the console. |
| grafana_admin_pass | see vaulted defaults | The admin pass for logging into the console. |

### Group Variables
| Variable | Default | Description |
|----------|---------|-------------|
| grafana_data_dir |  ~ | Location for grafana database. |
| grafana_ip_address | ~ | IP address to reach grafana. |
| grafana_port | ~ | The port grafana is exposed on. |

## Example Playbook

```yaml

---
- name: Install and configure monitoring tools prometheus and alertmanager
  hosts: monitoring 
  roles:
    - prometheus 
    - alertmanager 
    - grafana 

```

## Example group_vars 
```yaml

---

grafana_data_dir: /mnt/grafana
grafana_ip_address: 10.0.3.2 
grafana_port: 3000 

```
