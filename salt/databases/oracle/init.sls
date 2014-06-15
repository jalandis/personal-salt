{% set oracle = salt['grains.filter_by']({
    'Debian': {
      'client': {
        'source': 'salt://databases/oracle/packages/oracle-instantclient12.1-basic_12.1.0.1.0-2_amd64.deb',
        'dir': '/usr/lib/oracle/12.1/client64'
      }, 'sqlplus': {
        'source': 'salt://databases/oracle/packages/oracle-instantclient12.1-sqlplus_12.1.0.1.0-2_amd64.deb'
      }, 'sdk': {
        'source': 'salt://databases/oracle/packages/oracle-instantclient12.1-devel_12.1.0.1.0-2_amd64.deb'
      }
    },
    'default': 'Debian',
}) %}

Set Oracle Client Environment:
  file.append:
    - name: /home/vagrant/.profile
    - text: |
        export C_INCLUDE_PATH={{ oracle.client.dir }}
        export LD_LIBRARY_PATH="{{ oracle.client.dir }}/lib:$LD_LIBRARY_PATH"
        export TNS_ADMIN="{{ oracle.client.dir }}/lib"
        export ORACLE_BASE="{{ oracle.client.dir }}/lib"
        export ORACLE_HOME=$ORACLE_BASE
        export PATH=$PATH:{{ oracle.client.dir }}/bin

Oracle Client:
  pkg.installed:
    - sources:
      - oracle-instantclient12.1-basic: {{ oracle.client.source }}

Oracle Client Fix:
  file.symlink:
    - name: {{ oracle.client.dir }}/lib/libclntsh.so
    - target: {{ oracle.client.dir }}/lib/libclntsh.so.12.1
    - requires:
      - pkg: Oracle Client

Oracle SQL Plus:
  pkg.installed:
    - sources:
      - oracle-instantclient12.1-sqlplus: {{ oracle.sqlplus.source }}

Oracle SDK:
  pkg.installed:
    - sources:
      - oracle-instantclient12.1-devel: {{ oracle.sdk.source }}