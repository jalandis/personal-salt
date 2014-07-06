include:
  - databases.oracle
  - php.pear

PHP Oracle:
  pecl.installed:
    - name: oci8
    - defaults: true
    - require:
      - pkg: PHP Pear
      - sls: databases.oracle

PHP OCI8 Extension:
  file.append:
     - name: /etc/php5/cli/php.ini
     - text: extension=oci8.so

PHP OCI8 Dependencies:
  pkg.latest:
    - pkgs:
      - 'libaio1'