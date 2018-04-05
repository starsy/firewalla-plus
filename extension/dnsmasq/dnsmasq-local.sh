#!/bin/bash

/home/pi/firewalla/extension/dnsmasq/dnsmasq.armv7l -k -x /home/pi/.firewalla/run/dnsmasq-local.pid -u pi -C /home/pi/firewalla/extension/dnsmasq/dnsmasq-local.conf -r /home/pi/.firewalla/run/dnsmasq.resolv.conf --local-service &

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
for job in `jobs -p`; do wait $job; echo "$job exited"; done
