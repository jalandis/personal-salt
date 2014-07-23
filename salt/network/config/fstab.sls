{% for mount, args in pillar['mounts'].iteritems() %}
Create Mount ({{ args.mnt_point }}):
  mount.mounted:
    - name: {{ args.mnt_point }}
    - device: {{ mount }}
    - fstype: {{ args.fstype }}
    - opts: {{ args.opts }}
    - dump: 0
    - pass_num: 0
    - persist: True
    - mkmnt: True
    - mount: False
{% endfor %}

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