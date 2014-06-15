{% set java = salt['grains.filter_by']({
    'Debian': {'pkg': 'openjdk-6-jdk'},
    'default': 'Debian',
}) %}

Java 6 Latest:
   pkg.latest:
     - name: {{ java.pkg }}