{% set apache = salt['grains.filter_by']({
    'Debian': {'pkg': 'apache2'},
    'default': 'Debian',
}) %}

Apache:
  pkg.latest:
    - name: {{ apache.pkg }}