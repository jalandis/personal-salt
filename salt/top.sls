institutes:
  'os:Ubuntu':
    - match: grain
    # - android
    # - backup
    - browsers.chrome
    - browsers.firefox

    # mariadb and mysql cannot be installed together
    # Removal is a prerequisite of install
    # - databases.mariadb
    - databases.mysql

    - databases.mongodb
    - databases.postgres
    # - databases.sqldeveloper
    - java.java-7
    - libreoffice
    # - network
    - nodejs
    - php
    - provisioning.puppet
    - texteditors.sublime
    - texteditors.atom
    - utilities.logrotate
    - versionControl.subversion
    - versionControl.mercurial
    - versionControl.git
    - virtualization.virtualbox
    - virtualization.vagrant