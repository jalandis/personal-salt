institutes:
  'tower-of-power':
    - browsers.chrome
    - browsers.firefox
    - browsers.firefox.32bit
    - browsers.icedtea
    - java.java-7
    - libreoffice
    - network.cifs
    - network.config.fstab
    - network.freerdp
    - network.nmap
    - network.remmina
    - network.remmina.config
    - network.ssh.client
    - network.ssh.config
    - php
    - php.curl
    - php.mssql
    - php.mysql
    - php.oracle
    - provisioning.salt.minion
    - python
    - python.pip
    - texteditors.atom
    - texteditors.sublime
    - texteditors.sublime.config
    - texteditors.vim
    # - ubuntu.gsettings
    - ubuntu.upgrade
    - users
    - utilities.alien
    - utilities.ant
    - utilities.logrotate
    - versionControl.git
    #- versionControl.git.repositories
    - versionControl.mercurial
    #- versionControl.mercurial.repositories
    - versionControl.subversion
    - virtualization.virtualbox
    - virtualization.vagrant

  'os:Ubuntu':
    - match: grain
    # - android.studio
    # - apache
    # # - backup
    # - browsers.chrome
    # - browsers.firefox
    # - browsers.firefox.32bit
    # - browsers.icedtea

    # # # mariadb and mysql cannot be installed together
    # # # Removal is a prerequisite of install
    # - databases.mariadb
    # # - databases.mysql

    # - databases.mongodb
    # - databases.postgres
    # - databases.oracle
    - utilities.dconf-tools
    # - gimp
    # - haskell
    # - ides.eclipse
    # - java.ivy
    # - java.java-7
    # - java.java-6
    # - libreoffice
    # - network.cifs
    # - network.config.fstab
    # - network.freerdp
    # - network.nmap
    # - network.pidgin
    # - network.remmina
    # - network.remmina.config
    # - network.ssh.client
    # - network.ssh.server
    # - network.ssh.config
    # - network.wireshark
    # - nodejs
    # - php
    # - php.mssql
    # - php.mysql
    # - php.oracle
    # - php.pear
    # - provisioning.puppet
    # - provisioning.salt.minion
    # - provisioning.salt.master
    # - python
    # - python.indicator
    # - python.pip
    # - ruby
    # - salt-config
    # - texteditors.atom
    # - texteditors.sublime
    # - texteditors.sublime.config
    # - texteditors.vim
    # - ubuntu.gsettings
    # - ubuntu.upgrade
    # - ubuntu-sdk
    # - users
    # - utilities.alien
    # - utilities.ant
    # - utilities.logrotate
    # - versionControl.bazaar
    # - versionControl.clients.smartgithg
    # - versionControl.git
    # - versionControl.git.repositories
    # - versionControl.mercurial
    # - versionControl.subversion
    # - virtualization.virtualbox
    # - virtualization.vagrant