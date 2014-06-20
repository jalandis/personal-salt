{% set cifs = salt['grains.filter_by']({
    'Debian': {'pkg': 'cifs-utils'},
    'default': 'Debian',
}) %}

Cifs Latest:
  pkg.latest:
    - name: {{ cifs.pkg }}