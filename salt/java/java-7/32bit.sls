Java 7 32 Bit Unpack:
  file.directory:
    - name: /usr/lib32/jvm/jre1.7.0_60
    - makedirs: true

  archive.extracted:
    - name: /usr/lib32/jvm/jre1.7.0_60
    - source: salt://java/java-7/jre-7u60-linux-i586.tar.gz
    - archive_format: tar
    - tar_options: ' --strip-components=1 -'
    - source_hash: md5=331a7ef8230de0939941d1e9b3b761fd
    - if_missing: /usr/lib32/jvm/jre1.7.0_60/bin
    - requires:
      - file: Java 7 32 Bit Unpack

# tar preserve permissions???
# Test library requirements -> libnpjp2.so may have unmet requirements
# plugin.state.java
# plugin.load_appdir_plugins

Java 7 Correct Permissions:
  file.directory:
    - name: /usr/lib32/jvm/jre1.7.0_60
    - user: root
    - group: root
    - recurse:
      - user
      - group
    - requires:
      - archive: Java 7 32 Bit Unpack