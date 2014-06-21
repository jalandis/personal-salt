{% set haskell = salt['grains.filter_by']({
    'Debian': {'pkg': 'haskell-platform'},
    'default': 'Debian',
}) %}

Haskell Latest:
   pkg.latest:
     - name: {{ haskell.pkg }}