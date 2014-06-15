{% set eclipse = salt['grains.filter_by']({
    'Debian': {'pkg': 'eclipse-platform'},
    'default': 'Debian',
}) %}

Eclipse Latest:
  pkg.installed:
    - name: {{ eclipse.pkg }}