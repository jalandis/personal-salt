{% for user, user_args in pillar['users'].iteritems() %}
Sublime Settings ({{ user }}):
  file.managed:
    - name: /home/{{ user }}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    - source: salt://texteditors/sublime/config/Preferences.sublime-settings
    - user: {{ user }}
    - group: {{ user }}
    - mode: '0666'
    - makedirs: true
    - recurse:
      - user
      - group
{% endfor %}