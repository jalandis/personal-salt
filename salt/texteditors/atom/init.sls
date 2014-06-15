{% set atom = salt['grains.filter_by']({
    'Debian': {'pkg': 'atom'},
    'default': 'Debian',
}) %}

Atom Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: webupd8team/atom
    - require_in:
      - pkg: Atom Latest
  {% endif %}

  pkg.latest:
    - name: {{ atom.pkg }}