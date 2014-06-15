{% set mariadb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mariadb-server'},
    'default': 'Debian',
}) %}

{% set mysql = salt['grains.filter_by']({
    'Debian': { 'server': {'pkg': 'mysql-server-5.5'}, 'client': {'pkg': 'mysql-client-5.5'}},
    'default': 'Debian',
}) %}

{% set mariadb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mariadb-server'},
    'default': 'Debian',
}) %}

MySQL Server Removal:
  pkg.removed:
    - name: {{ mysql.server.pkg }}
    - required_in:
      - pkg: MySQL Client Removal

MySQL Client Removal:
  pkg.removed:
    - name: {{ mysql.client.pkg }}
    - required_in:
      - pkg: Maria DB Latest

Maria DB Latest:
  pkg.latest:
    - name: {{ mariadb.pkg }}