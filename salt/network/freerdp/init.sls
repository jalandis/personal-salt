{% set freerdp = salt['grains.filter_by']({
    'Debian': {'pkg': 'freerdp-x11'},
    'default': 'Debian',
}) %}

Freerdp Latest:
  pkg.latest:
    - name: {{ freerdp.pkg }}