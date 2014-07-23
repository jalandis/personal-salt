include:
  - users

{% for user, user_config in pillar['remmina'].iteritems() %}
  {% for connection, connection_config in user_config.iteritems() %}
Remmina Connection ({{ connection }}):
  file.managed:
    - name: /home/{{user}}/.remmina/{{ connection }}.remmina
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0644'
    - makedirs: true
    - recurse:
      - user
      - group
    - source: salt://network/remmina/config/template.remmina
    - template: jinja
    - context:
        group: {{ connection_config['group'] }}
        password: {{ connection_config['password'] }}
        username: {{ connection_config['username'] }}
        sharefolder: {{ connection_config['sharefolder'] }}
        domain: {{ connection_config['domain'] }}
        server: {{ connection_config['server'] }}
        colordepth: {{ connection_config['colordepth'] }}
        connection_name: {{ connection }}
  {% endfor %}
{% endfor %}