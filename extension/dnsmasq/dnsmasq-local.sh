sudo /home/pi/firewalla/extension/dnsmasq/dnsmasq.armv7l -k -x /home/pi/.firewalla/run/dnsmasq-local.pid -u pi -C /home/pi/firewalla/extension/dnsmasq/dnsmasq-local.conf -r /home/pi/.firewalla/run/dnsmasq.resolv.conf --local-service 

sudo \cp -f /home/pi/firewalla/extension/dnsmasq/no_truncate  /etc/dhcp/dhclient-enter-hooks.d/aa_no_truncate