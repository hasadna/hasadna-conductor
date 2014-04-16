include:
  - circus

app-pkgs:
  pkg.installed:
    - names:
      - git
      - python-virtualenv
      - python-dev
      - libmysqlclient-dev

{{ pillar['username'] }}:
  - user.present:
    - fullname: {{ pillar['fullname'] }}

repo:
  git.latest:
    - name: {{ pillar['git_repo'] }}
    - rev: {{ pillar['git_rev'] }}
    - target: ~{{ pillar['username'] }}
    - force: true
    - require:
      - pkg: app-pkgs

settings:
  file.managed:
    - name: ~{{ pillar['username'] }}/local_settings.py
    - source: salt://settings/{{ pillar['username'] }}_settings.py
    - template: jinja
    - watch:
      - git: repo

admin:
  django.createsuperuser:
    - settings_module: ~{{ pillar['username'] }}/local_settings.py
    - username: daonb
    - email: bennydoan@gmail.com

nginx:
  pkg:
    - latest
  service:
    - running
    - watch:
      - file: nginxconf

nginxconf:
  file.managed:
    - name: /etc/nginx/sites-enabled/{{ pillar['username'] }}.conf
    - source: salt://nginx/{{ pillar['username'] }}.conf
    - template: jinja
    - makedirs: True
    - mode: 755

gunicorn:
  pkg.install

gunicorn_circus:
    file.managed:
        - name: /etc/circus.d/{{ pillar['username'] }}.ini
        - source: salt://gunicron/{{ pillar['username'] }}.ini
        - makedirs: True
        - watch_in:
            - service: circusd
        - require:
            - pkg: gunicorn

