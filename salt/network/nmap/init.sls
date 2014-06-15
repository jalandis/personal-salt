{% set nmap = salt['grains.filter_by']({
    'Debian': {'pkg': 'nmap'},
    'default': 'Debian',
}) %}

Nmap Latest:
  pkg.latest:
    - name: {{ nmap.pkg }}