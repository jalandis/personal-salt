{% set postgres = salt['grains.filter_by']({
    'Debian': {'pkg': 'postgresql', 'service': 'postgresql'},
    'default': 'Debian',
}) %}

Postgres Latest:
  pkg.latest:
     - name: {{ postgres.pkg }}

  service.running:
    - enable: true
    - name: {{ postgres.service }}
    - require:
      - pkg: Postgres Latest