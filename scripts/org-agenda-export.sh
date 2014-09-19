#!/bin/bash

if [ ! -d /tmp/org ]; then
  mkdir /tmp/org
fi

rm /tmp/org/*.org
cp ~/org/*.org /tmp/org/

emacs -batch -l ~/.emacs -eval '(org-batch-agenda "e" org-agenda-files (quote ("/tmp/org/")))' \
   > ~/org/aux/agenda-export.txt


#if [ "$(pidof emacs)" ] ; then
#
#echo "" > /dev/null
#
#else
#   emacs -batch -l ~/.emacs -eval '(org-batch-agenda "e")' > ~/org/aux/agenda-export.txt ;

#fi;
