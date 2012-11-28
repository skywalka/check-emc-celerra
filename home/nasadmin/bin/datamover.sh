#!/bin/bash
#
# This script is fully siiick. It checks if the Virtual Data Mover is active. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010072901
#
/nas/bin/nas_server -i -vdm id=1|grep -q "actual = loaded, active"
if [ $? != 1 ]
 then
  echo "OK - the Virtual Data Mover is loaded and active"
  exit 0
 else
  echo "The Virtual Data Mover has failed over"
  exit 1
fi

