#
# ~/.bashrc
#

if [[ -f /.chroot ]]; then
   PS1='[\u \W (32)]\$ '
fi

complete -cf sudo
complete -cf man
