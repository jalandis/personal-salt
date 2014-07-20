{% set psycopg2 = salt['grains.filter_by']({
    'Debian': {'pkg': 'python-psycopg2'},
    'default': 'Debian',
}) %}

Psycopg2 Latest:
  pkg.installed:
    - name: {{ psycopg2.pkg }}