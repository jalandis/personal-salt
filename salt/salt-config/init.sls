Truncate Minion Log:
  cmd.run:
    - name: truncate --size 0 /var/log/salt/minion
    - order: 1

Set Clock Frequency:
  file.append:
     - name: /home/vagrant/.profile
     - text: export RDTSC_FREQUENCY=2688
     - order: 2