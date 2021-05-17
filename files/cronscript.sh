#!/bin/bash
while true
do
 IPs=$(curl -s consul:8500/v1/agent/health/service/name/webservers | jq -c '[ .[] | select (.AggregatedStatus | contains ("passing")) ]' | jq .[].Service.Address)
 echo -e "nginx webservers running at:\n$IPs" > /nginx_ips.html
 sleep 1
done
