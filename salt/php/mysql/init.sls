{% set php_mysql = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php5-mysql'},
    'default': 'Debian',
}) %}

Php Mysql:
  pkg.latest:
    - name: {{ php_mysql.pkg }}