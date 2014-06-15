{% set saltminion = salt['grains.filter_by']({
    'Debian': {'pkg': 'salt-minion'},
    'default': 'Debian',
}) %}

Salt Minion Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: saltstack/salt
    - require_in:
      - pkg: Salt Minion Latest
  {% endif %}

  pkg.latest:
    - name: {{ saltminion.pkg }}