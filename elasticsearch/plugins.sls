{% set plugin_cmd = salt['pillar.get']('elasticsearch:es_home', '/usr/share/elasticsearch') ~ '/bin/plugin' %}
{% for plugin in salt['pillar.get']('elasticsearch:plugins:installed', []) %}
elasticsearch-plugin-{{ plugin.name }}:
  cmd.run:
    - name: {{ plugin_cmd }} install {{ plugin.path }}
    - unless: {{ plugin_cmd }} list | grep {{ plugin.path }}
    - require:
      - pkg: elasticsearch-pkg
{% endfor %}

{% for plugin in salt['pillar.get']('elasticsearch:plugins:absent', []) %}
elasticsearch-plugin-{{ plugin.name }}-absent:
  cmd.run:
  - name: {{ plugin_cmd }} remove {{ plugin.name }}
  - onlyif: {{ plugin_cmd }} list | grep {{ plugin.name }}
  - require:
    - pkg: elasticsearch-pkg
{% endfor %}
