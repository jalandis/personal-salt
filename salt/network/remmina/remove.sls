{% set remmina = salt['grains.filter_by']({
    'Debian': {'pkg': 'remmina'},
    'default': 'Debian',
}) %}

Remove Remmina:
  pkg.remove:
    - name: {{ remmina.pkg }}