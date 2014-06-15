{% set python = salt['grains.filter_by']({
    'Debian': {'pkg': 'python'},
    'default': 'Debian',
}) %}

Python Latest:
  pkg.latest:
    - name: {{ python.pkg }}