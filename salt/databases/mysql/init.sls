{% set mysql = salt['grains.filter_by']({
    'Debian': { 'server': {'pkg': 'mysql-server-5.5'}, 'client': {'pkg': 'mysql-client-5.5'}},
    'default': 'Debian',
}) %}

{% set mariadb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mariadb-server'},
    'default': 'Debian',
}) %}

Maria DB Removal:
  pkg.removed:
    - name: {{ mariadb.pkg }}
    - required_in:
      - pkg: Mysql Client Latest

Mysql Client Latest:
   pkg.latest:
     - name: {{ mysql.client.pkg }}
     - required_in:
       - pkg: Mysql Server Latest

Mysql Server Latest:
   pkg.latest:
     - name: {{ mysql.server.pkg }}