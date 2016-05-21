elasticsearch-repository-key:
  cmd.run:
  - name: wget -q -O- "https://packages.elasticsearch.org/GPG-KEY-elasticsearch" | apt-key add -
  - unless: apt-key list | grep elasticsearch.org

elasticsearch-repository-2.x:
  pkgrepo.managed:
  - file: /etc/apt/sources.list.d/elasticsearch-2.x.list
  - name: 'deb http://packages.elastic.co/elasticsearch/2.x/debian stable main'
  - require:
    - cmd: elasticsearch-repository-key
