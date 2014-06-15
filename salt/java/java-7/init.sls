{% set java = salt['grains.filter_by']({
    'Debian': {'pkg': 'openjdk-7-jdk'},
    'default': 'Debian',
}) %}

Java 7 Latest:
   pkg.latest:
     - name: {{ java.pkg }}