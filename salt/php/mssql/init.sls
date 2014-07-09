{% set sybase = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php5-sybase'},
    'default': 'Debian',
}) %}

PHP MsSQL:
  pkg.latest:
    - name: {{ sybase.pkg }}
    - require:
      - pkg: PHP Latest

PHP FreeTDS Settings:
  file.append:
     - name: /etc/freetds/freetds.conf
     - text: |
        [global]
          tds version = 8.0
          client charset = UTF-8