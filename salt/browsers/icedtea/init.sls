{% set icedtea = salt['grains.filter_by']({
    'Debian': {'pkg': 'icedtea-plugin'},
    'default': 'Debian',
}) %}

Icedtea Java Plugin Latest:
  pkg.latest:
    - name: {{ icedtea.pkg }}