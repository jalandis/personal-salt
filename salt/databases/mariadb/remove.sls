{% set mariadb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mariadb-server'},
    'default': 'Debian',
}) %}

Maria DB Removal:
  pkg.removed:
    - name: {{ mariadb.pkg }}
    - required_in:
      - pkg: Mysql Client Latest