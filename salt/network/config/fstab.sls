{% for user, user_args in pillar['users'].iteritems() %}
  {% if user_args['fstab_creds'] is defined %}
    {% for file in user_args['fstab_creds'] %}
Creds {{ file }}:
  file.managed:
    - name: {{ file }}
    - source: salt://network/config/templates/.credentials
    - template: jinja
    - context:
        username: {{ user_args['fstab_creds'][file]['username'] }}
        password: {{ user_args['fstab_creds'][file]['password'] }}
        domain: {{ user_args['fstab_creds'][file]['domain'] }}
    {% endfor %}
  {% endif %}
{% endfor %}

{% for mount in pillar['mounts'] %}
Create Mounted Directories ({{ mount }}):
  file.directory:
    - name: {{ mount }}
{% endfor %}

Setup Fstab:
  file.managed:
    - name: /etc/fstab
    - source: salt://network/config/templates/fstab
    - template: jinja
    - context:
    {% for user, user_args in pillar['users'].iteritems() %}
      {% if user_args['fstab_creds'] is defined %}
        {% for file in user_args['fstab_creds'] %}
        {{ user }}_credential_file: {{ file }}
        {% endfor %}
      {% endif %}
    {% endfor %}