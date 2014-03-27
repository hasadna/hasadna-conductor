redis-server:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: chris-lea/redis-server
    - require_in:
      - pkg: redis-server
  {% endif %}
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: redis-server
