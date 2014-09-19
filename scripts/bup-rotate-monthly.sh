#!/bin/bash

BUP=/media/bup
PASS=`cat /home/jwheny/installed/config/files/bup-pass.txt`

# overview
# rsync monthly.2 -> yearly.0
# rm monthly.2
# mv monthly.1    -> monthly.2
# mv monthly.0    -> monthly.1

if [[ -e /dev/sdb1 ]] ; then

   if mountpoint -q /media/bup ; then

      echo "bup already mounted; proceeding" 

   else
     echo "bup not mounted; mounting..."
     truecrypt -t --protect-hidden=no -k "" --password=$PASS --filesystem=none --slot=2 /dev/sdb1 ;
     mount /media/bup ;

   fi;

   if [ -d $BUP/vault.monthly.2 ] ; then    
      rm -rf $BUP/vault.monthly.2
   fi;

   if [ -d $BUP/vault.monthly.1 ] ; then
      mv $BUP/vault.monthly.1 $BUP/vault.monthly.2 ;
   fi;

   if [ -d $BUP/vault.monthly.0 ] ; then
      mv $BUP/vault.monthly.0 $BUP/vault.monthly.1 ;
   fi;

   if [ -d $BUP/vault.weekly.2 ] ; then
      mv $BUP/vault.weekly.2 $BUP/vault.monthly.0 ;
   fi;

   umount /media/bup ;
   truecrypt -d /dev/sdb1 ;

fi;
