{% set php = salt['grains.filter_by']({
    'Debian': {'pkg': 'php5', 'mysql_pkg' : 'php5-mysql'},
    'default': 'Debian',
}) %}

PHP Latest:
  pkg.latest:
    - name: {{ php.pkg }}

Php Mysql:
  pkg.latest:
    - name: {{ php.mysql_pkg }}