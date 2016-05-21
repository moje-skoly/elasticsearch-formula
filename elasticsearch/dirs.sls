{% for name, path in pillar.elasticsearch.config.path.items() %}
elasticsearch-{{ name }}-dir:
  file.directory:
  - name: {{ path }}
  - user: elasticsearch
  - group: elasticsearch
  - mode: 755
  - makedirs: true
  - require:
    - user: elasticsearch-user
  - require_in:
    - file: elasticsearch-config
{% endfor %}

{% if pillar.elasticsearch.pid_dir is defined %}
elasticsearch-pid-dir:
  file.directory:
  - name: {{ pillar.elasticsearch.pid_dir }}
  - user: elasticsearch
  - group: elasticsearch
  - mode: 755
  - makedirs: true
  - require:
    - user: elasticsearch-user
  - require_in:
    - file: elasticsearch-defaults
{% endif %}
