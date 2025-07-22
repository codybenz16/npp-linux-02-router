#!/bin/bash

# note: no -it

rtrA="docker exec -it clab-mod2-bgp-rtrA"
rtrB="docker exec -it clab-mod2-bgp-rtrB"
rtrC="docker exec -it clab-mod2-bgp-rtrC"
rtrD="docker exec -it clab-mod2-bgp-rtrD"

$rtrA bird -c /etc/bird/bird.conf &
$rtrB bird -c /etc/bird/bird.conf &
$rtrC bird -c /etc/bird/bird.conf &
$rtrD bird -c /etc/bird/bird.conf &

