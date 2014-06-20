{% for user, user_args in pillar['users'].iteritems() %}
    {% if user_args['sublime_settings'] is defined %}
Sublime Settings:
  file.managed:
    - name: /home/{{ user }}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    - text: {{ user_args['sublime_settings'] }}
    - makedirs: true
  {% endif %}
{% endfor %}