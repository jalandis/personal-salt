{% set php_curl = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php5-curl'},
    'default': 'Debian',
}) %}

PHP Curl Latest:
  pkg.latest:
    - name: {{ php_curl.pkg }}
    - require:
      - pkg: PHP Latest