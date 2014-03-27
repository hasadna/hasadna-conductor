openssh-server:
  pkg:
    - installed

ssh:
  service:
    - running
    - watch:
      - file: /etc/ssh/sshd_config
    - require:
      - pkg: openssh-server

no_password_access:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: "#PasswordAuthentication yes"
    - repl: "PasswordAuthentication no"

no_root_login:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: "PermitRootLogin yes"
    - repl: "PermitRootLogin no"

