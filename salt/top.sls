institutes:
  'os:Ubuntu':
    - match: grain
    # - android
    - apache
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
    - ides.eclipse
    - java.java-7
    - libreoffice
    # - network
    - nodejs
    - php
    - provisioning.puppet
    - provisioning.salt.minion
    - provisioning.salt.master
    - python
    - salt-config
    - texteditors.atom
    - texteditors.sublime
    - texteditors.vim
    - ubuntu
    - utilities.logrotate
    - utilities.icedtea
    - versionControl.subversion
    - versionControl.mercurial
    - versionControl.git
    - virtualization.virtualbox
    - virtualization.vagrant