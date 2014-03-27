{% if grains['os'] == 'Ubuntu' %}
salt-minion-repo:
  pkgrepo.managed:
    - ppa: saltstack/salt
    - require_in:
      - pkg: salt-minion
{% endif %}

{% if grains['os'] == 'Debian' %}
salt-minion-repo:
  pkgrepo.managed:
    - name: deb http://debian.saltstack.com/debian wheezy-saltstack main
    - file: /etc/apt/sources.list
    - key_url: http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key
    - require_in:
      - pkg: salt-minion
{% endif %}

salt-minion:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: salt-minion
