#!/bin/bash
#
# This script is fully siiick. It checks if an NFS export is exported to the RainFinity FMA. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010111101
#
/usr/sbin/showmount -a syd1ddm01 |grep -q "syd1fma01.ce.corp:/backup/fma"
if [ $? != 1 ]
 then
  echo "OK - /backup/fma is mounted by syd1fma01"
  exit 0
 else
  echo "CRITICAL - /backup/fma is not mounted by syd1fma01"
  exit 2
fi

