{% set ssh_server = salt['grains.filter_by']({
    'Debian': {'pkg': 'openssh-server'},
    'default': 'Debian',
}) %}

SSH Server Latest:
  pkg.latest:
    - name: {{ ssh_server.pkg }}