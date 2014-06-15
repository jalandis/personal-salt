{% set chrome = salt['grains.filter_by']({
    'Debian': {'pkg': 'chromium-browser'},
    'default': 'Debian',
}) %}

Chrome Latest:
  pkg.latest:
    - name: {{ chrome.pkg }}