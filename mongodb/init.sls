mongodb-repo:
  pkgrepo.managed:
    - name: deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen
    - file: /etc/apt/sources.list
    - key_url: http://docs.mongodb.org/10gen-gpg-key.asc
    - require_in:
      - pkg: mongodb-10gen

mongodb-10gen:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: mongodb

Run ufw_allow_27017:
  cmd.wait:
    - name: ufw allow 27017
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw
