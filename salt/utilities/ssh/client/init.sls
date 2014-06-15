{% set ssh_client = salt['grains.filter_by']({
    'Debian': {'pkg': 'openssh-client'},
    'default': 'Debian',
}) %}

SSH client Latest:
  pkg.latest:
    - name: {{ ssh_client.pkg }}