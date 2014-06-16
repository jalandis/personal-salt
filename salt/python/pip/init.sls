{% set pip = salt['grains.filter_by']({
    'Debian': {'pkg': 'python-pip'},
    'default': 'Debian',
}) %}

Pip Latest:
  pkg.latest:
    - name: {{ pip.pkg }}
    - require:
      - pkg: Python Latest