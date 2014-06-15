{% set subversion = salt['grains.filter_by']({
    'Debian': {'pkg': 'subversion'},
    'default': 'Debian',
}) %}

Subversion Latest:
   pkg.latest:
     - name: {{ subversion.pkg }}