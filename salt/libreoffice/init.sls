{% set libreoffice = salt['grains.filter_by']({
    'Debian': {'pkg': 'libreoffice-gnome'},
    'default': 'Debian',
}) %}

Office Libre Latest:
  pkg.latest:
    - name: libreoffice