initial:
  pkg.installed:
    - pkgs:
      - python-software-properties
      - software-properties-common
      - libxml2-dev

{% if grains['os'] == 'Debian' %}
dotdeb:
  pkgrepo.managed:
    - name: deb http://packages.dotdeb.org wheezy all
    - file: /etc/apt/sources.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg

dotdeb-src:
  pkgrepo.managed:
    - name: deb-src http://packages.dotdeb.org wheezy all
    - file: /etc/apt/sources.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg
{% endif %}
