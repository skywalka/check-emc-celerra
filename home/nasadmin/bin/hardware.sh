#!/bin/bash
#
# This script is fully siiick. It checks the Hardware Status. Like I said earlier, it's awesome.
#
# Author: Luke Harris
#
# version: 2010072901
#
HW=`/nas/sbin/enclosure_status -e 0 -v|grep -ci "failed"`
if [ "$HW" -gt 0 ]
 then
  echo "Hardware error, please investigate"
  exit 1
 else
  echo "OK - Hardware operating normally"
  exit 0
fi

