{% set alien = salt['grains.filter_by']({
    'Debian': {'pkg': 'alien'},
    'default': 'Debian',
}) %}

Alien Latest:
  pkg.latest:
    - name: {{ alien.pkg }}