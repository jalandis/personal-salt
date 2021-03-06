{% set sublime = salt['grains.filter_by']({
    'Debian': {'pkg': 'sublime-text-installer'},
    'default': 'Debian',
}) %}

Sublime Text 3 Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: webupd8team/sublime-text-3
    - require_in:
      - pkg: Sublime Text 3 Latest
  {% endif %}

  pkg.latest:
    - name: {{ sublime.pkg }}
    - skip_verify: true