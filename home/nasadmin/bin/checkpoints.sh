#!/bin/bash
#
# This script is fully siiick. It checks the checkpoints. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010072901
#
if [ -z "$1" ]
then
 echo "Please include an argument, eg."
 echo "checkpoints.sh data1"
exit 1
fi
/nas/bin/nas_ckpt_schedule -l|grep "$1"|grep -q Active
if [ $? != 1 ]
 then
  echo "OK - Checkpoints for $1 are active"
  exit 0
 else
  echo "Checkpoints for $1 are not active"
  exit 1
fi

