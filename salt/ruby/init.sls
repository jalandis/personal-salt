{% set ruby = salt['grains.filter_by']({
    'Debian': {'pkg': 'ruby'},
    'default': 'Debian',
}) %}

Ruby Latest:
  pkg.latest:
    - name: {{ ruby.pkg }}