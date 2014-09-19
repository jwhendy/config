#!/bin/bash

BUP=/media/bup
PASS=`cat /home/jwhendy/installed/config/files/bup-pass.txt`

# overview
# rsync weekly.2 -> monthly.0
# rm weekly.2
# mv weekly.1    -> weekly.2
# mv weekly.0    -> weekly.1

if [[ -e /dev/sdb1 ]] ; then

   if mountpoint -q /media/bup ; then

      echo "bup already mounted; proceeding" 

   else
     echo "bup not mounted; mounting..."
     truecrypt -t --protect-hidden=no -k "" --password=$PASS --filesystem=none --slot=2 /dev/sdb1 ;
     mount /media/bup ;

   fi;

   if [ -d $BUP/vault.weekly.2 ] ; then    
      rm -rf $BUP/vault.weekly.2 ;
   fi;

   if [ -d $BUP/vault.weekly.1 ] ; then
      mv $BUP/vault.weekly.1 $BUP/vault.weekly.2 ;
   fi;

   if [ -d $BUP/vault.weekly.0 ] ; then
      mv $BUP/vault.weekly.0 $BUP/vault.weekly.1 ;
   fi;

   if [ -d $BUP/vault.daily.2 ] ; then
      mv $BUP/vault.daily.2 $BUP/vault.weekly.0 ;
   fi;

   umount /media/bup ;
   truecrypt -d /dev/sdb1 ;

fi;
