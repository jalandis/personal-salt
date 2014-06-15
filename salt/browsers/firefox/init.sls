{% set firefox = salt['grains.filter_by']({
    'Debian': {'pkg': 'firefox'},
    'default': 'Debian',
}) %}

Firefox:
  pkg.latest:
    - name: {{ firefox.pkg }}