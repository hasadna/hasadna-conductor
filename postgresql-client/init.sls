postgres-client-repo:
  pkgrepo.managed:
    {% if grains['os'] == 'Ubuntu' %}
    - name: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
    {% elif grains['os'] == 'Debian' %}
    - name: deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main
    {% endif %}
    - file: /etc/apt/sources.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql-client-9.3
      - pkg: libpq-dev

postgresql-client-9.3:
  pkg:
    - installed

libpq-dev:
  pkg:
    - installed
