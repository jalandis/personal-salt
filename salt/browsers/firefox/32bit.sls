include:
  - java.java-7.32bit
  - users

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
      - 'libxtst6:i386'

Firefox Unpack:
  file.directory:
    - name: /usr/lib32/firefox
    - makedirs: true
    - mode: '0755'

  archive.extracted:
    - name: /usr/lib32/firefox
    - source: "https://download.mozilla.org/?product=firefox-30.0-SSL&os=linux&lang=en-US"
    - source_hash: md5=469be1f0aaf537f16e17c324bb5baa6b
    - archive_format: tar
    # Temporary Hack (https://github.com/saltstack/salt/issues/10293)
    - tar_options: ' --strip-components=1 -'
    - if_missing: /usr/lib32/firefox/firefox
    - requires:
      - file: Firefox Unpack
      - pkg: FireFox 32 Bit Dependencies

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

{% for user, user_args in pillar['users'].iteritems() %}
Firefox Profiles Configuration ({{ user }}):
  file.managed:
    - name: /home/{{ user }}/.mozilla/firefox/profiles.ini
    - makedirs: true
    - source: salt://browsers/firefox/config/profiles.ini
    - user: {{ user }}
    - group: {{ user }}

Firefox Java Plugin ({{ user }}):
  file.symlink:
    - name: /home/{{ user }}/.mozilla/firefox/profile.mozilla32/plugins/libnpjp2.so
    - makedirs: true
    - target: /usr/lib32/jvm/jre1.7.0_60/lib/i386/libnpjp2.so
    - user: {{ user }}
    - group: {{ user }}
{% endfor %}