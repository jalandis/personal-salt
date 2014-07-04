{% for user, args in pillar['users'].iteritems() %}
  {{ user }}:
    user.present:
      - fullname: {{ args['fullname'] }}
      - password: {{ args['password'] }}
      - home:     {{ args['home'] }}
      - groups:
      {% for group in args['groups'] %}
        - {{ group }}
      {% endfor %}
      - enforce_password: False
      - remove_groups: False
      - order: 1
{% endfor %}