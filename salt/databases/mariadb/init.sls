{% set mariadb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mariadb-server'},
    'default': 'Debian',
}) %}

Maria DB Latest:
  pkg.latest:
    - name: {{ mariadb.pkg }}