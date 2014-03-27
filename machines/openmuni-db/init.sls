pg_listen_directive:
  file.replace:
    - name: /etc/postgresql/9.3/main/postgresql.conf
    - pattern: "#listen_addresses = 'localhost'"
    - repl: "listen_addresses = 'localhost, 10.240.51.173'"

pg_host_access_directive:
  file.append:
    - name: /etc/postgresql/9.3/main/pg_hba.conf
    - text:
      - host  openbudgets  robot  10.240.203.194/32  md5

/etc/postgresql/9.3/main:
  file.directory:
    - user: postgres
    - group: postgres
    - dir_mode: 755
    - file_mode: 644
    - recurse:
        - user
        - group
        - mode
