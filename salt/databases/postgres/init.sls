{% set postgres = salt['grains.filter_by']({
    'Debian': {'pkg': 'postgresql'},
    'default': 'Debian',
}) %}

Postgres Latest:
   pkg.latest:
     - name: {{ postgres.pkg }}