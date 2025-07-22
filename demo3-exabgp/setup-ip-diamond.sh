#!/bin/bash

rtrA="docker exec -it clab-mod2-bgp-rtrA"
rtrB="docker exec -it clab-mod2-bgp-rtrB"
rtrC="docker exec -it clab-mod2-bgp-rtrC"
rtrD="docker exec -it clab-mod2-bgp-rtrD"
lan1="docker exec -it clab-mod2-bgp-lan1"
lan2="docker exec -it clab-mod2-bgp-lan2"

# Configure rtrA interfaces
$rtrA ip addr add 10.10.1.1/24 dev eth1
$rtrA ip addr add 10.10.2.1/24 dev eth2
$rtrA ip addr add 1.1.1.1/24 dev eth3
$rtrA ip link set eth1 up
$rtrA ip link set eth2 up
$rtrA ip link set eth3 up

# Configure rtrB interfaces
$rtrB ip addr add 10.10.1.2/24 dev eth1
$rtrB ip addr add 10.10.3.1/24 dev eth2
$rtrB ip addr add 10.10.6.2/24 dev eth3
$rtrB ip link set eth1 up
$rtrB ip link set eth2 up
$rtrB ip link set eth3 up

# Configure rtrC interfaces
$rtrC ip addr add 10.10.2.2/24 dev eth1
$rtrC ip addr add 10.10.4.1/24 dev eth2
$rtrC ip addr add 10.10.6.1/24 dev eth3
$rtrC ip link set eth1 up
$rtrC ip link set eth2 up
$rtrC ip link set eth3 up

# Configure rtrD interfaces
$rtrD ip addr add 10.10.3.2/24 dev eth1
$rtrD ip addr add 10.10.4.2/24 dev eth2
$rtrD ip addr add 4.4.4.4/24 dev eth3
$rtrD ip link set eth1 up
$rtrD ip link set eth2 up
$rtrD ip link set eth3 up

# Configure lan1
$lan1 ip addr add 1.1.1.1/24 dev eth1
$lan1 ip link set eth1 up
$lan1 ip route add default via 1.1.1.1

# Configure lan2
$lan2 ip addr add 4.4.4.4/24 dev eth1
$lan2 ip link set eth1 up
$lan2 ip route add default via 4.4.4.4




#echo "The number of arguments is: $#"
#echo "arg1 = $1"

if [ $# != 1 ]
then
   echo "specify delete or create"
elif [ $1 == "delete" ]
then 
   delete_setup
elif [ $1 == "create" ]
then
   create_setup
else
   echo "specify delete or create"
fi
