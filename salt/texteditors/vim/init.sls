{% set vim = salt['grains.filter_by']({
    'Debian': {'pkg': 'vim'},
    'default': 'Debian',
}) %}

Vim Latest:
  pkg.latest:
    - name: {{ vim.pkg }}