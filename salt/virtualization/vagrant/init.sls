{% set vagrant = salt['grains.filter_by']({
    'Debian': {'pkg': 'vagrant'},
    'default': 'Debian',
}) %}

Vagrant Latest:
   pkg.latest:
     - name: {{ vagrant.pkg }}