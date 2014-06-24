{% set icedtea32 = salt['grains.filter_by']({
    'Debian': {'pkg': 'icedtea-7-plugin:i386'},
    'default': 'Debian',
}) %}

Icedtea 32 Bit Java Plugin Latest:
  pkg.latest:
    - name: {{ icedtea32.pkg }}