include:
  - python.pip

{% set virtualenv = salt['grains.filter_by']({
    'Debian': {'pip': 'virtualenv'},
    'default': 'Debian',
}) %}

{% set virtualenvwrapper = salt['grains.filter_by']({
    'Debian': {'pip': 'virtualenvwrapper'},
    'default': 'Debian',
}) %}

Virtualenv Latest:
  pip.installed:
    - name: {{ virtualenv.pip }}

Virtualenv Wrapper Latest:
  pip.installed:
    - name: {{ virtualenvwrapper.pip }}