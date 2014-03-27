ufw:
  pkg:
    - installed

Run ufw_deny:
  cmd.run:
    - name: ufw default deny
    - cwd: /
    - require:
        - pkg: ufw

Run ufw_allow_22:
  cmd.wait:
    - name: ufw allow 22
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_allow_80:
  cmd.wait:
    - name: ufw allow 80
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_allow_443:
  cmd.wait:
    - name: ufw allow 443
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_allow_587:
  cmd.wait:
    - name: ufw allow 587
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_allow_4505:
  cmd.wait:
    - name: ufw allow 4505
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_allow_4506:
  cmd.wait:
    - name: ufw allow 4506
    - cwd: /
    - watch:
      - cmd: Run ufw_deny
    - require:
        - pkg: ufw

Run ufw_enable:
  cmd.wait:
    - name: ufw enable
    - cwd: /
    - require:
        - pkg: ufw
