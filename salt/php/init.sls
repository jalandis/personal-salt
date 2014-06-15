{% set php = salt['grains.filter_by']({
    'Debian': {'pkg': 'php5'},
    'default': 'Debian',
}) %}

PHP Latest:
  pkg.latest:
    - name: {{ php.pkg }}