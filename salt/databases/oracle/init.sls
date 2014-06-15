{% set oracle = salt['grains.filter_by']({
    'Debian': {
      'client': {
        'source': 'salt://databases/oracle/packages/oracle-instantclient12.1-basic_12.1.0.1.0-2_amd64.deb'
      }, 'sqlplus': {
        'source': 'salt://databases/oracle/packages/oracle-instantclient12.1-sqlplus_12.1.0.1.0-2_amd64.deb'
      }
    },
    'default': 'Debian',
}) %}

Oracle Client:
  pkg.installed:
    - sources:
      - oracle-instantclient12.1-basic: {{ oracle.client.source }}

Oracle SQL Plus:
  pkg.installed:
    - sources:
      - oracle-instantclient12.1-sqlplus: {{ oracle.sqlplus.source }}