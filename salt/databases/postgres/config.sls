include:
  - users
  - network.ssh.config.server

{% for username, config in pillar['postgres']['users'].iteritems() %}
Creating Postgres User ({{ username }}):
  postgres_user.present:
    - name: {{ username }}
    - password: {{ config['password'] }}
    - createdb: true
    - createroles: true
    - login: true
    - require:
      - service: Postgres Latest
{% endfor %}

{% for database, config in pillar['postgres']['databases'].iteritems() %}
  postgres_database.present:
    - name: {{ database }}
    - owner: {{ config['owner'] }}
    - lc_ctype: en_US.UTF-8
    - lc_collate: en_US.UTF-8
    - require:
      - postgres_user: Creating Postgres User ({{ config['owner'] }})
{% endfor %}

# Breaking vagrant ssh
# Postrgres SSH Config:
#   file.replace:
#     - name: /etc/ssh/sshd_config
#     - pattern: '#AuthorizedKeysFile\s+%h/\.ssh/authorized_keys'
#     - repl: 'AuthorizedKeysFile\s+%h/\.ssh/authorized_keys'
#     - backup: ''
#     - require:
#       - pkg: SSH Server Latest

Postrgres Config:
  file.replace:
    - name: /etc/postgresql/9.3/main/pg_ident.conf
    - pattern: "#listen_addresses = 'localhost'"
    - repl: "listen_addresses = 'localhost'"
    - backup: ''