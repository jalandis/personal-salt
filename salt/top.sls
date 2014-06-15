institutes:
  'os:Ubuntu':
    - match: grain
    - android.studio
    - apache
    # - backup
    - browsers.chrome
    - browsers.firefox
    - browsers.icedtea

    # mariadb and mysql cannot be installed together
    # Removal is a prerequisite of install
    - databases.mariadb
    # - databases.mysql

    - databases.mongodb
    - databases.postgres
    # - databases.sqldeveloper
    - ides.eclipse
    - java.java-7
    - libreoffice
    - network.freerdp
    - network.nmap
    - network.ssh.client
    - network.ssh.server
    - network.wireshark
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
    - versionControl.subversion
    - versionControl.mercurial
    - versionControl.git
    - virtualization.virtualbox
    - virtualization.vagrant