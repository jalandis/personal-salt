{% set android_studio = salt['grains.filter_by']({
    'Debian': {'pkg': 'android-studio'},
    'default': 'Debian',
}) %}

Android Studio Latest:
  {% if grains['os_family'] == 'Debian' %}
  pkgrepo.managed:
    - ppa: paolorotolo/android-studio
    - require_in:
      - pkg: Android Studio Latest
  {% endif %}

  pkg.latest:
    - name: {{ android_studio.pkg }}
    - requires:
      - pkg: Java 7 Latest