{% set dconf_tools = salt['grains.filter_by']({
    'Debian': {'pkg': 'dconf-tools'},
    'default': 'Debian',
}) %}

Dconf Tools Latest:
  pkg.latest:
    - name: {{ dconf_tools.pkg }}