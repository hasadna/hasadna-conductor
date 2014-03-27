Run ufw_allow_3306:
  cmd.wait:
    - name: ufw allow 3306
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

mysql-server-5.5:
  pkg:
    - installed

mysql-common-5.5:
  pkg:
    - installed

mysql:
  service:
    - running
    - require:
      - pkg: mysql-server-5.5

mysql_user:
  mysql_user.present:
    - name: robot
    - host: localhost
    - password:
    - connection_user: robot
    - connection_pass:
    - connection_charset: utf8
    - saltenv:
      - LC_ALL: "en_US.utf8"
    - require:
      - pkg: mysql-server-5.5
