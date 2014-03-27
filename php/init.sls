php-dotdeb:
  pkgrepo.managed:
    - name: deb http://packages.dotdeb.org wheezy-php55 all
    - file: /etc/apt/sources.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg

php-dotdeb-src:
  pkgrepo.managed:
    - name: deb-src http://packages.dotdeb.org wheezy-php55 all
    - file: /etc/apt/sources.list
    - key_url: http://www.dotdeb.org/dotdeb.gpg

php:
  pkg.installed:
    - pkgs:
      - php5
      - php5-cli
      - php5-fpm
      - php5-common
      - php5-gd
      - php5-mysql
      - zip
      - unzip
