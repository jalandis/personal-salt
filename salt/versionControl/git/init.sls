{% set git = salt['grains.filter_by']({
    'Debian': {'pkg': 'git'},
    'default': 'Debian',
}) %}

Git Latest:
   pkg.latest:
     - name: {{ git.pkg }}