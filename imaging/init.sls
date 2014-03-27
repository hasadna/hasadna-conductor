libjpeg8-dev:
  pkg:
    - installed

libpng-dev:
  pkg:
    - installed

zlib1g-dev:
  pkg:
    - installed

libfreetype6-dev:
  pkg:
    - installed

liblcms1-dev:
  pkg:
    - installed

/usr/lib/libjpeg.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libjpeg.so

/usr/lib/libpng.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libpng.so

/usr/lib/libz.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libz.so

/usr/lib/libfreetype.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/libfreetype.so

/usr/lib/liblcms.so:
  file.symlink:
    - target: /usr/lib/x86_64-linux-gnu/liblcms.so
