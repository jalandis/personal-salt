{% set virtualbox = salt['grains.filter_by']({
    'Debian': {'pkg': 'virtualbox'},
    'default': 'Debian',
}) %}

Virtualbox Latest:
   pkg.latest:
     - name: {{ virtualbox.pkg }}