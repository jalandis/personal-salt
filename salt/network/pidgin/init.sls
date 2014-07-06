{% set pidgin = salt['grains.filter_by']({
    'Debian': {'pkg': 'pidgin'},
    'default': 'Debian',
}) %}

Pidgin Latest:
  pkg.latest:
    - name: {{ pidgin.pkg }}