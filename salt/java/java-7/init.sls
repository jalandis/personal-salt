{% set java = salt['grains.filter_by']({
    'Debian': {'pkg': 'openjdk-7-jre'},
    'default': 'Debian',
}) %}

Java 7 Latest:
   pkg.latest:
     - name: {{ java.pkg }}