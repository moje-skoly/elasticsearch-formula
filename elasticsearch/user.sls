elasticsearch-user:
  user.present:
  - name: elasticsearch
  - shell: /bin/false
  - createhome: False
  - gid_from_name: True
