python:
  pkg:
    - installed

python-pip:
  pkg:
    - installed

virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

virtualenvwrapper:
  pip.installed:
    - require:
      - pkg: python-pip
