#!/bin/bash

DAT=/mnt/vault
BUP=/mnt/bup
CONFIG=/home/jwhendy/installed/config/files
PASS=`cat /home/jwhendy/installed/config/files/bup-pass.txt`

# overview
# rsync hourly.2 -> daily.0
# rm hourly.2
# mv hourly.1    -> hourly.2
# mv hourly.0    -> hourly.1


if [[ -e /dev/sdb1 ]] ; then

   if mountpoint -q /mnt/bup ; then

      echo "bup already mounted; proceeding" 

   else
     echo "bup not mounted; mounting..."
     cryptsetup --type tcrypt open /dev/sdb1 bup ;
     mount /dev/mapper/bup /mnt/bup ;

   fi;

     if [ -d $BUP/temp ] ; then
        rm -rf $BUP/temp ;
     fi;

     rsync -avzO  --delete --exclude-from=$CONFIG/rsync-excludes /home/jwhendy/ $DAT/jwhendy/ ;
     rsync -avzO  --delete --exclude=vault* --link-dest=../vault.hourly.0 $DAT/ $BUP/temp ;

     if [ -d $BUP/vault.hourly.2 ] ; then    
        rm -rf $BUP/vault.hourly.2 ;
     fi;

     if [ -d $BUP/vault.hourly.1 ] ; then
        mv $BUP/vault.hourly.1 $BUP/vault.hourly.2 ;
     fi;

     if [ -d $BUP/vault.hourly.0 ] ; then
        mv $BUP/vault.hourly.0 $BUP/vault.hourly.1 ;
     fi;

     mv $BUP/temp $BUP/vault.hourly.0 ;

     umount /mnt/bup ;
     cryptsetup close bup ;

fi;
