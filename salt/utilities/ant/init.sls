{% set ant = salt['grains.filter_by']({
    'Debian': {'pkg': 'ant'},
    'default': 'Debian',
}) %}

Ant Latest:
  pkg.latest:
    - name: {{ ant.pkg }}