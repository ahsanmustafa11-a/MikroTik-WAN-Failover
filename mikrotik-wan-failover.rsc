/interface
set [find default-name=ether1] name=WAN1
set [find default-name=ether2] name=WAN2

/ip route

add dst-address=8.8.8.8 gateway=192.168.1.1 scope=10

add dst-address=0.0.0.0/0 gateway=8.8.8.8 \
distance=1 target-scope=11

add dst-address=0.0.0.0/0 gateway=192.168.2.1 \
distance=2

/ip firewall nat

add chain=srcnat out-interface=WAN1 action=masquerade

add chain=srcnat out-interface=WAN2 action=masquerade
