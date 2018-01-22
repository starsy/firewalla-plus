#!/bin/bash

NO_TRUNCATE='export TRUNCATE_NAMESERVER_LIST_AFTER_LOOPBACK_ADDRESS=0'

grep "$NO_TRUNCATE" /etc/dhcp/debug

if [ $? -ne 0 ]; then
  sudo sh -c "echo $NO_TRUNCATE >> /etc/dhcp/debug"
  if [ $? -eq 0 ]; then
    echo "NO_TRUNCATE after local cache is set"
    exit 0
  fi
else
  echo "NO_TRUNCATE after local cache is NOT set"
fi

LOCAL_CACHE="prepend domain-name-servers 127.0.0.1;"

grep "$LOCAL_CACHE" /etc/dhcp/dhclient.conf

if [ $? -ne 0 ]; then
  sudo sh -c "echo $LOCAL_CACHE >> /etc/dhcp/dhclient.conf"
  if [ $? -eq 0 ]; then
    echo "LOCAL DNS CACHE is set"
    exit 0
  fi
else
  echo "LOCAL DNS CACHE is not set"
fi
