#!/bin/bash
#
# This script is fully siiick. It checks the User Mapper service. Like I said earlier, it's awesome.
#
# Author: Luke Harris
#
# version: 2009072901
#
/nas/bin/server_usermapper server_2|grep -q "Service Class: Secondary"
if [ $? != 1 ]
 then
  echo "OK - User Mapper Service Class: Secondary"
  exit 0
 else
  echo "Please check the User Mapper service"
  exit 1
fi

