#!/bin/bash
#
# This script is fully siiick. It checks if the SAVVOL is greater than a user defined limit. Like I said earlier, it's sick.
#
# Author: Luke Harris
#
# version: 2010102601
#
if [ -z "$1" -o -z "$2" ]
then
 echo "Please include two arguments, eg."
 echo "savvol.sh data1 70"
exit 1
fi

for i in `/nas/bin/nas_fs -info $1|grep ^ckpts| awk '{print $3}'|awk -F, '{print $1}'`
do CKPT=`/nas/sbin/rootnas_fs -i -s "$i"|grep size`
CKPTTOTAL=`echo "$CKPT"|awk '{print $6}'`
CKPTAVAIL=`echo "$CKPT"|awk '{print $9}'`
CKPTUSED=`echo "$CKPT"|awk '{print $12}'`

CKPTTOTAL2=$(bc << EOF
scale=1
$CKPTTOTAL/1024
EOF
)

CKPTAVAIL2=$(bc << EOF
scale=1
$CKPTAVAIL/1024
EOF
)

CKPTUSED2=$(bc << EOF
scale=1
$CKPTUSED/1024
EOF
)

done

SAVVOL=`/nas/bin/fs_ckpt "$1" -l -a|grep root|head -1|awk '{print $6}'|sed 's/\%//'`
if [ $SAVVOL -gt "$2" ]
then
  echo "Total = ${CKPTTOTAL2}G, Available = ${CKPTAVAIL2}G, Used = ${CKPTUSED2}G, SAVVOL = $SAVVOL% | SIZE=${CKPTTOTAL2} USED=${CKPTUSED2} AVAIL=${CKPTAVAIL2} USE=$SAVVOL"
  exit 1
 else
  echo "OK - Total = ${CKPTTOTAL2}G, Available = ${CKPTAVAIL2}G, Used = ${CKPTUSED2}G, SAVVOL = $SAVVOL% | SIZE=${CKPTTOTAL2} USED=${CKPTUSED2} AVAIL=${CKPTAVAIL2} USE=$SAVVOL"
  exit 0
fi

