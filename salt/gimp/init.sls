{% set gimp = salt['grains.filter_by']({
    'Debian': {'pkg': 'gimp'},
    'default': 'Debian',
}) %}

Gimp Latest:
  pkg.latest:
    - name: {{ gimp.pkg }}