{% set pear = salt['grains.filter_by']({
    'Debian': {'pkg' : 'php-pear'},
    'default': 'Debian',
}) %}

PHP Pear:
  pkg.latest:
    - name: {{ pear.pkg }}
    - require:
      - pkg: PHP Latest