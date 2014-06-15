{% set logrotate = salt['grains.filter_by']({
    'Debian': {'pkg': 'logrotate'},
    'default': 'Debian',
}) %}

Logrotate Latest:
  pkg.latest:
    - name: {{ logrotate.pkg }}