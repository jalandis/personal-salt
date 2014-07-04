{% set ivy = salt['grains.filter_by']({
    'Debian': {'pkg': 'ivy'},
    'default': 'Debian',
}) %}

Ivy Latest:
   pkg.latest:
     - name: {{ ivy.pkg }}