{% set smartgithg = salt['grains.filter_by']({
    'Debian': {'pkg': 'smartgithg'},
    'default': 'Debian',
}) %}

SmartGitHg Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: eugenesan/ppa
    - require_in:
      - pkg: SmartGitHg Latest
  {% endif %}

  pkg.latest:
    - name: {{ smartgithg.pkg }}