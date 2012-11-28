#!/bin/bash
#
# This script is fully siiick. It checks if the CIFS Servers are running. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010072901
#
CIFS=`/nas/bin/server_cifs server_2 |grep "CIFS Server"|wc -l`
if [ $CIFS -eq 3 ]
 then
  echo "OK - CIFS Servers are ONLINE"
  exit 0
 elif [ $CIFS -eq 2 ]
 then
  echo "WARNING - Only 2 CIFS Servers are ONLINE"
  exit 1
 elif [ $CIFS -eq 1 ]
 then
  echo "WARNING - Only 1 CIFS Server is ONLINE"
  exit 1
 elif [ $CIFS -eq 0 ]
 then
  echo "CRITICAL - CIFS Servers are OFFLINE"
  exit 2
fi

