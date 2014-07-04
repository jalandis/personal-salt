{% set firefox = salt['grains.filter_by']({
    'Debian': {'pkg': 'firefox'},
    'default': 'Debian',
}) %}

Firefox Latest:
  pkg.latest:
    - name: {{ firefox.pkg }}