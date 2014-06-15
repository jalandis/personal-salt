{% set mongodb = salt['grains.filter_by']({
    'Debian': {'pkg': 'mongodb-org'},
    'default': 'Debian',
}) %}

Mongo DB Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - humanname: Mongo DB PPA
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: Mongo DB Latest
  {% endif %}

  pkg.latest:
    - name: {{ mongodb.pkg }}