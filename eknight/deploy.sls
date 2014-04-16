repo:
  git.latest:
    - name: {{ pillar['git_repo'] }}
    - rev: {{ pillar['git_rev'] }}
    - target: ~{{ pillar['username'] }}
    - force: true

env:
  virtualenv.manage:
    - requirements: requirements.txt
    - no_site_packages: true
    - clear: false
    - require:
      - pkg: app-pkgs
      - file: settings

db:
  django.syncdb:
    - settings_module: ~{{ pillar['username'] }}/local_settings.py
    - migrate: True

staticfiles:
  django.collectstatic:
    - settings_module: ~{{ pillar['username'] }}/local_settings.py

# Do we need to do anythng to refresh the gunicorn process?
# refresh:

