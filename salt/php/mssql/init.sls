{% set sybase = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php5-sybase'},
    'default': 'Debian',
}) %}

PHP MsSQL:
  pkg.latest:
    - name: {{ sybase.pkg }}
    - require:
      - pkg: PHP Latest