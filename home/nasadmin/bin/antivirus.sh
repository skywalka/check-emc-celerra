#!/bin/bash
#
# This script is fully siiick. It checks if the Anti Virus checker is running. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010072901
#
AV=`/nas/bin/server_viruschk server_2|grep "ONLINE"|wc -l`
if [ $AV -eq 2 ]
 then
  echo "OK - Anti Virus checker is ONLINE"
  exit 0
 elif [ $AV -eq 1 ]
 then
  echo "WARNING - Anti Virus checker is ONLINE on one CAVA server only"
  exit 1
 elif [ $AV -eq 0 ]
 then
  echo "CRITICAL - Anti Virus checker is not running!"
  exit 2
fi

