{% for user, user_args in pillar['users'].iteritems() %}
  {% if user_args['fstab_creds'] is defined %}
    {% for file in user_args['fstab_creds'] %}
Creds {{ file }}:
  file.managed:
    - name: {{ file }}
    - source: salt://network/config/.credentials
    - template: jinja
    - context:
        username: {{ user_args['fstab_creds'][file]['username'] }}
        password: {{ user_args['fstab_creds'][file]['password'] }}
        domain: {{ user_args['fstab_creds'][file]['domain'] }}
    {% endfor %}
  {% endif %}
{% endfor %}

{% for mount, config in pillar['mounts'].iteritems() %}
Create Mounted Directories ({{ mount }}):
  file.directory:
    - name: {{ mount }}

Create Fstab Entry ({{ mount }}):
  file.append:
    - name: /etc/fstab
    - text: {{ config }}
{% endfor %}