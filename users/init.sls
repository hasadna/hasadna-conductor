robot:
  user.present:
    - fullname: Robot
    - home: /home/robot
    - shell: /bin/bash
    - password:
    - enforce_password: True
    - groups:
      - www-data
      - sudo

/home/robot/.profile:
  file.append:
    - source: salt://users/environment_vars
    - user: robot
    - group: robot
    - mode: 664

/home/robot/.ssh:
  file.directory:
    - user: robot
    - group: robot
    - dir_mode: 775
    - file_mode: 664
    - recurse:
        - user
        - group
        - mode
