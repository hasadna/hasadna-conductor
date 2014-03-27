/srv/environments:
  file.directory:
    - user: robot
    - group: www-data
    - dir_mode: 775
    - file_mode: 775
    - recurse:
        - user
        - group
        - mode

/srv/projects:
  file.directory:
    - user: robot
    - group: www-data
    - dir_mode: 775
    - file_mode: 664
    - recurse:
        - user
        - group
        - mode

/srv/logs:
  file.directory:
    - user: robot
    - group: www-data
    - dir_mode: 775
    - file_mode: 664
    - recurse:
        - user
        - group
        - mode

/srv/ssl:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 775
    - file_mode: 644
    - recurse:
        - user
        - group
        - mode

/srv/salt:
  file.directory:
    - user: robot
    - group: www-data
    - dir_mode: 775
    - file_mode: 664
    - recurse:
        - user
        - group
        - mode

