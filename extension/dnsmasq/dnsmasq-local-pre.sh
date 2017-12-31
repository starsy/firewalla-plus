#!/bin/bash

NO_TRUNCATE='export TRUNCATE_NAMESERVER_LIST_AFTER_LOOPBACK_ADDRESS=0'

grep "$NO_TRUNCATE" /etc/dhcp/debug

if [ $? -ne 0 ]; then
  sudo sh -c "echo $NO_TRUNCATE >> /etc/dhcp/debug"
  if [ $? -eq 0 ]; then
    echo "NO_TRUNCATE IS SET" 
    exit 0
  fi
fi

echo "NO_TRUNCATE IS NOT SET"
