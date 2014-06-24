{% set java32 = salt['grains.filter_by']({
    'Debian': {'pkg': 'openjdk-6-jdk:i386'},
    'default': 'Debian',
}) %}

Java 7 32 Bit Latest:
   pkg.latest:
     - name: {{ java32.pkg }}