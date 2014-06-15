{% set saltmaster = salt['grains.filter_by']({
    'Debian': {'pkg': 'salt-master'},
    'default': 'Debian',
}) %}

{% set saltsyndic = salt['grains.filter_by']({
    'Debian': {'pkg': 'salt-syndic'},
    'default': 'Debian',
}) %}

Salt Master Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: saltstack/salt
    - require_in:
      - pkg: Salt Master Latest
      - pkg: Salt Syndic Latest
  {% endif %}

  pkg.latest:
    - name: {{ saltmaster.pkg }}

Salt Syndic Latest:
  pkg.latest:
    - name: {{ saltsyndic.pkg }}