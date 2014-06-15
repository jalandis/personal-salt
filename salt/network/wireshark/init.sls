{% set wireshark = salt['grains.filter_by']({
    'Debian': {'pkg': 'wireshark'},
    'default': 'Debian',
}) %}

Wireshark Latest:
  pkg.latest:
    - name: {{ wireshark.pkg }}