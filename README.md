# elasticsearch

Requires `java-oracle.jdk8-webupd8team` from `java-oracle-formula` in topfile to work properly. 

## setting up single instance

This is the default. Just change cluster name and you're good to go. 

## setting up cluster

Fill `config.discovery.zen.ping.unicast.hosts` with your nodes' IPs. 

Also fill `cluster_node_ips` if you're using ferm state. 



Based on elasticsearch state from [w3w s.r.o](https://github.com/w3w/). 