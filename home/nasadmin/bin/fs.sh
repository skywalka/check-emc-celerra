#!/bin/bash
#
# This script is fully siiick. It checks if the File System is greater than a user defined limit. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010102602
#
if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
 echo "Please include three arguments, eg."
 echo "fs.sh data1 90 95"
exit 1
fi
#FS=`/nas/bin/server_df server_2|grep "$1"$|awk '{print $5}'|sed 's/\%//'`
FS=`/nas/bin/server_df server_2|grep "^$1"`
SIZE=`echo $FS|awk '{print $2}'`
SIZE2=$(bc << EOF
scale = 1
$SIZE / 1024 / 1024
EOF
)
USED=`echo $FS|awk '{print $3}'`
USED2=$(bc << EOF
scale = 1
$USED / 1024 / 1024
EOF
)
AVAIL=`echo $FS|awk '{print $4}'`
AVAIL2=$(bc << EOF
scale = 1
$AVAIL / 1024 / 1024
EOF
)

PERCENT=`echo $FS|awk '{print $5}'|sed 's/\%//'`

if [ $PERCENT -gt "$3" ]
then
  echo "Size = ${SIZE2}G, Used = ${USED2}G, Avail = ${AVAIL2}G, Use = $PERCENT% | SIZE=${SIZE2} USED=${USED2} AVAIL=${AVAIL2} USE=$PERCENT"
  exit 2
else
if [ $PERCENT -gt "$2" ]
then
  echo "Size = ${SIZE2}G, Used = ${USED2}G, Avail = ${AVAIL2}G, Use = $PERCENT% | SIZE=${SIZE2} USED=${USED2} AVAIL=${AVAIL2} USE=$PERCENT"
  exit 1
 else
  echo "OK - Size = ${SIZE2}G, Used = ${USED2}G, Avail = ${AVAIL2}G, Use = $PERCENT% | SIZE=${SIZE2} USED=${USED2} AVAIL=${AVAIL2} USE=$PERCENT"
  exit 0
fi
fi

