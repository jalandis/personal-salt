{% set php_curl = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php5-curl'},
    'default': 'Debian',
}) %}

PHP Curl Latest:
  pkg.latest: {{ php_curl.pkg }}
    - name:
    - require:
      - pkg: PHP Latest