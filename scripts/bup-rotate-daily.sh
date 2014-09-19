#!/bin/bash

BUP=/media/bup
PASS=`cat /home/jwhendy/installed/config/files/bup-pass.txt`

# overview
# rsync daily.2 -> weekly.0
# rm daily.2
# mv daily.1    -> daily.2
# mv daily.0    -> daily.1

if [[ -e /dev/sdb1 ]] ; then

   if mountpoint -q /media/bup ; then

      echo "bup already mounted; proceeding" 

   else
     echo "bup not mounted; mounting..."
     truecrypt -t --protect-hidden=no -k "" --password=$PASS --filesystem=none --slot=2 /dev/sdb1 ;
     mount /media/bup ;

   fi;

   if [ -d $BUP/vault.daily.2 ] ; then    
      rm -rf $BUP/vault.daily.2 ;
   fi;

   if [ -d $BUP/vault.daily.1 ] ; then
      mv $BUP/vault.daily.1 $BUP/vault.daily.2 ;
   fi;

   if [ -d $BUP/vault.daily.0 ] ; then
      mv $BUP/vault.daily.0 $BUP/vault.daily.1 ;
   fi;

   if [ -d $BUP/vault.hourly.2 ] ; then
      mv $BUP/vault.hourly.2 $BUP/vault.daily.0 ;
   fi;

   umount /media/bup ;
   truecrypt -d /dev/sdb1 ;

fi;
