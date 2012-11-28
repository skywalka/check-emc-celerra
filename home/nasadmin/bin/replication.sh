#!/bin/bash
#
# This script is fully siiick. It checks the replication status of vdm1 and file systems. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010072901
#
if [ -z "$1" ]
then
 echo "Please include an argument, eg."
 echo "replication.sh data1"
exit 1
fi
/nas/bin/nas_replicate -l|grep "$1"|grep "\-->ic-mascot"|grep -q OK
if [ $? != 1 ]
 then
  echo "OK - Replication is running from Prod -> D.R."
  exit 0
 else
  echo "Replication is not running from Prod -> D.R."
  exit 1
fi

