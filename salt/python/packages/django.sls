include:
  - python.pip

{% set django = salt['grains.filter_by']({
    'Debian': {'pkg': 'python-django', 'pip': 'Django'},
    'default': 'Debian',
}) %}

Django Latest:
  pip.installed:
    - name: {{ django.pip }}