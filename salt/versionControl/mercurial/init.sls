{% set mercurial = salt['grains.filter_by']({
    'Debian': {'pkg': 'mercurial'},
    'default': 'Debian',
}) %}

Mercurial Latest:
   pkg.latest:
     - name: {{ mercurial.pkg }}