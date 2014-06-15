{% set nodejs = salt['grains.filter_by']({
    'Debian': {'pkg': 'nodejs', 'npm' : {'pkg' : 'npm'}},
    'default': 'Debian',
}) %}

Nodejs Latest:
  pkg.latest:
    - name: {{ nodejs.pkg }}

Npm Latest:
  pkg.latest:
    - name: {{ nodejs.npm.pkg }}