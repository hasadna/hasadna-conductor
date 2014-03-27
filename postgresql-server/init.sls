Run ufw_allow_5432:
  cmd.wait:
    - name: ufw allow 5432
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

postgres-server-repo:
  pkgrepo.managed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
    {% elif grains['os'] == 'Debian' %}
    - name: deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main
    {% endif %}
    - file: /etc/apt/sources.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql-9.3
      - pkg: postgresql-contrib-9.3

postgresql-9.3:
  pkg:
    - installed

postgresql-contrib-9.3:
  pkg:
    - installed

postgresql:
  service:
    - running
    - require:
      - pkg: postgresql-9.3

postgresql_user:
  postgres_user.present:
    - name: robot
    - password:
    - createdb: True
    - require:
      - pkg: postgresql-9.3
