base:
  '*':
    - initial
    - maintenance
    - build
    - ssh
    - firewall
    - python
    - users
    - directories
    - git
    - hg
    - salt-minion
  'conductor':
    - salt-master
    - machines.conductor
  'openmuni-app.c.openmunibudgets.internal':
    - supervisor
    - nginx
    - redis
    - postgresql-client
    - imaging
  'openmuni-db.c.openmunibudgets.internal':
    - supervisor
    - postgresql-server
    - machines.openmuni-db
  'hasadna-analytics.c.openmunibudgets.internal':
    - nginx
    - php
    - mysql-client
