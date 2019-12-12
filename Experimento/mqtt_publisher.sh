#!/bin/bash
# $1 ip broker server
# $1 port broker server
# $3 topic

broker_ip=$1
topic=$2

while true;
do
    sudo mosquitto_pub -h $broker_ip -t $topic -m "$(((RANDOM % 2)))";
    tm=$(((RANDOM % 1) + 1));
    echo "$tm $topic $broker_ip $(((RANDOM % 2)))" >> ~/testemqtt.txt;
    sleep $tm;
done
