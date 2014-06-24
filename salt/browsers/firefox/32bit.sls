include:
  - java.java-6.32bit
  - browsers.icedtea.32bit

Firefox Unpack:
  file.directory:
    - name: /usr/lib32/firefox
    - makedirs: true
    - mode: '0755'

  archive.extracted:
    - name: /usr/lib32/firefox
    - source: "https://download-installer.cdn.mozilla.net/pub/firefox/releases/30.0/linux-x86_64/en-US/firefox-30.0.tar.bz2"
    - source_hash: md5=a4979b84a7d68f77d4109282a468f041
    - archive_format: tar
    # Temporary Hack (https://github.com/saltstack/salt/issues/10293)
    - tar_options: ' --strip-components=1 -'
    - if_missing: /usr/lib32/firefox/firefox

FireFox 32 Bit Dependencies:
  pkg.latest:
    - pkgs:
      - 'lib32z1'
      - 'lib32ncurses5'
      - 'lib32bz2-1.0'
      - 'libstdc++6:i386'
      - 'libxrender1:i386'
      - 'libasound2:i386'
      - 'libdbus-glib-1-2:i386'
      - 'libgtk2.0-0:i386'
      - 'libxt6:i386'

Firefox Install Executable:
  file.managed:
    - name: /usr/bin/firefox32
    - user: root
    - group: root
    - mode: '0777'
    - source: salt://browsers/firefox/config/firefox32

Firefox Install Desktop:
  file.managed:
    - name: /usr/share/applications/firefox32.desktop
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: true
    - source: salt://browsers/firefox/config/firefox32.desktop

  cmd.run:
    - name: desktop-file-install /usr/share/applications/firefox32.desktop
    - requires:
      - file: Firefox Install Desktop