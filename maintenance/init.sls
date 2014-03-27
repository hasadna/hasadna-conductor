maintenance:
  pkg.installed:
    - pkgs:
      - unattended-upgrades

/etc/apt/apt.conf.d/10periodic:
  file.managed:
    - source: salt://maintenance/10periodic
    - user: root
    - group: root
    - mode: 644

unattended_upgrade_minimal_steps:
  file.replace:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - pattern: '//Unattended-Upgrade::MinimalSteps "true";'
    - repl: 'Unattended-Upgrade::MinimalSteps "true";'

unattended_upgrade_remove_unused_deps:
  file.replace:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - pattern: '//Unattended-Upgrade::Remove-Unused-Dependencies "false";'
    - repl: 'Unattended-Upgrade::Remove-Unused-Dependencies "true";'

unattended_upgrade_auto_reboot:
  file.replace:
    - name: /etc/apt/apt.conf.d/50unattended-upgrades
    - pattern: '//Unattended-Upgrade::Automatic-Reboot "false";'
    - repl: 'Unattended-Upgrade::Automatic-Reboot "true";'
