{% set bazaar = salt['grains.filter_by']({
    'Debian': {'pkg': 'bzr'},
    'default': 'Debian',
}) %}

Bazaar Latest:
   pkg.latest:
     - name: {{ bazaar.pkg }}