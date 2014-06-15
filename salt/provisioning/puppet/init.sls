{% set puppet = salt['grains.filter_by']({
    'Debian': {'pkg': 'puppet'},
    'default': 'Debian',
}) %}

Puppet:
  pkg.latest:
    - name: {{ puppet.pkg }}