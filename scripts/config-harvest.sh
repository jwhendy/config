#! /bin/bash

DIR=/home/jwhendy/installed/config/files;


###
# system config harvest
###

cp /etc/fstab $DIR/fstab

if [ -f /home/jwhendy/.ncmpcpp/config ] ; then
  cp /home/jwhendy/.ncmpcpp/config $DIR/ncmpcpp-config
fi ;

if [ -f /home/jwhendy/.mpd/mpd-config ] ; then
  cp /home/jwhendy/.mpd/mpd-config $DIR/mpd-config
fi ;

cp /boot/config-bigBang* $DIR/

cp /home/jwhendy/.Xdefaults $DIR/.Xdefaults

cp /home/jwhendy/.bashrc $DIR/

cp /home/jwhendy/.bash_profile $DIR/

cp /home/jwhendy/.Rprofile $DIR/

cp /home/jwhendy/.gtkrc-2.0 $DIR/

cp /home/jwhendy/.config/gtk-3.0/settings.ini $DIR/gtk-3.0-settings.ini

cp /etc/mkinitcpio.conf $DIR/mkinitcpio.conf

cp /etc/modprobe.d/* $DIR/

cp /etc/X11/xorg.conf.d/* $DIR/

cp /home/jwhendy/.emacs $DIR/.emacs

cp /home/jwhendy/org/aux/emacs-config.org $DIR/emacs-config.org

cp /home/jwhendy/.config/chromium/Default/Bookmarks $DIR/chromium-bookmarks

pacman -Qq > $DIR/package-list

###
# end system config harvest
###


###
# openbox harvest
###

cp /home/jwhendy/.config/openbox/rc.xml $DIR/
cp /home/jwhendy/.config/openbox/autostart.sh $DIR/
cp /home/jwhendy/.config/openbox/menu.xml $DIR/
cp /home/jwhendy/.config/tint2/tint2rc $DIR/tint2rc
cp /etc/conky/*.conf $DIR/

###
# end openbox harvest
###


###
# last run dates
###

touch $DIR/00-last-run
rm $DIR/*-last-run
touch $DIR/`eval date +%m-%d-%Y`-last-run
