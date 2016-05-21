include:
  - ferm

ferm-config-elasticsearch:
  file.managed:
  - name: /etc/ferm/conf.d/elasticsearch.conf
  - source: salt://elasticsearch/files/ferm.conf
  - template: jinja
  - require:
    - file: ferm-custom-rules-directory
  - watch_in:
    - service: ferm
