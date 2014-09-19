#!/bin/bash

CURRENT_TIME=$(date +'%X')

sudo date -s "1 FEB 2013 $CURRENT_TIME"

sudo /etc/rc.d/vpnagentd start
sudo /etc/rc.d/ciscod start

/opt/cisco/anyconnect/bin/vpn connect gra.3m.com
sudo htpdate -s www.linux.com www.freebsd.org
