#!/bin/bash
#
# This script is fully siiick. It checks if a share is approaching it's quota limit. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010102601
#
if [ -z "$1" -o -z "$2" -o -z "$3" ]
then
 echo "Please include three arguments, eg."
 echo "quota.sh data2 syd1 1024"
exit 1
fi
SHARE=`/nas/bin/nas_quotas server_2 -list -tree -fs "$1"|grep "$2"|awk '{print $2}'|sed 's/ //g'`
if [ -z "$SHARE" ]
then
 echo "Share does not exist"
 exit 1
fi
#/outils/system/snmp/QUOTA
FSQ=`/nas/bin/nas_quotas server_2 -report -tree -fs "$1"|grep "#$SHARE "|awk -F\| '{print $3 "," $4}'`
FS=`echo $FSQ|awk -F, '{print $1}'`
FS2=$(bc << EOF
scale = 1
$FS / 1024 / 1024
EOF
)
QUOTA=`echo $FSQ|awk -F, '{print $2}'`
QUOTA2=$(bc << EOF
scale = 1
$QUOTA / 1024 / 1024
EOF
)
FREESPACE=$(bc << EOF
($QUOTA - $FS) / 1024
EOF
)
FREESPACE2=$(bc << EOF
scale = 1
$FREESPACE / 1024
EOF
)
if [ "$FREESPACE" -lt "$3" ]
then
  echo "Quota = ${QUOTA2}G, Used = ${FS2}G, Free Space = ${FREESPACE2}G | SIZE=${QUOTA2} USED=${FS2} AVAIL=${FREESPACE2}"
  exit 1
 else
  echo "OK - Quota = ${QUOTA2}G, Used = ${FS2}G, Free Space = ${FREESPACE2}G | SIZE=${QUOTA2} USED=${FS2} AVAIL=${FREESPACE2}"
  exit 0
fi

