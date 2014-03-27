{% if grains['os'] == 'Ubuntu' %}
salt-master-repo:
  pkgrepo.managed:
    - ppa: saltstack/salt
    - require_in:
      - pkg: salt-master
      - pkg: salt-syndic
{% endif %}

{% if grains['os'] == 'Debian' %}
salt-master-repo:
  pkgrepo.managed:
    - name: deb http://debian.saltstack.com/debian wheezy-saltstack main
    - file: /etc/apt/sources.list
    - key_url: http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key
    - require_in:
      - pkg: salt-master
      - pkg: salt-syndic
{% endif %}

salt-master:
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: salt-master

salt-syndic:
  pkg:
    - installed
