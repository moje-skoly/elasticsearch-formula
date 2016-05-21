elasticsearch-swap:
  sysctl.present:
    - name: vm.swappiness
    - value: 0
