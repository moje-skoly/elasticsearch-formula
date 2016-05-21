include:
#  - .ferm
  - .packages
  - .repository
  - .user
  - .dirs
  - .plugins

elasticsearch-pkg:
  pkg.installed:
  - name: elasticsearch
  - require:
    - pkgrepo: elasticsearch-repository-2.x
    - pkg: jdk8

elasticsearch-config:
  file.managed:
  - name: {{ pillar.elasticsearch.config.path.conf|default('/etc/elasticsearch') }}/elasticsearch.yml
  - source: salt://elasticsearch/files/elasticsearch.yml
  - template: jinja
  - require:
    - pkg: elasticsearch-pkg
  - watch_in:
    - service: elasticsearch-service

elasticsearch-defaults:
  file.managed:
  - name: /etc/default/elasticsearch
  - source: salt://elasticsearch/files/elasticsearch
  - template: jinja
  - require:
    - pkg: elasticsearch-pkg
  - watch_in:
    - service: elasticsearch-service

elasticsearch-service:
  service.running:
  - name: elasticsearch
  - enable: True
  - provider: systemd
  - require:
    - pkg: elasticsearch-pkg
