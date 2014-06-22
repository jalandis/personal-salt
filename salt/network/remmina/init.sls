{% set remmina = salt['grains.filter_by']({
    'Debian': {'pkg': 'remmina'},
    'default': 'Debian',
}) %}

Remmina Latest:
  pkg.latest:
    - name: {{ remmina.pkg }}