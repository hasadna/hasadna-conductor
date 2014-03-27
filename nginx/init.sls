nginx:
  {% if grains['os'] == 'Ubuntu' %}
  pkgrepo.managed:
    - ppa: nginx/stable
    - require_in:
      - pkg: nginx
  {% endif %}
  pkg:
    - installed
  service:
    - running
    - require:
      - pkg: nginx

remove_nginx_default:
  file.absent:
    - name: /etc/nginx/sites-enabled/default
