#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#export XDG_CACHE_HOME=/dev/shm/jwhendy/.cache
#if [ ! -f $XDG_CACHE_HOME ];
#then
#    mkdir -p -m 0700 $XDG_CACHE_HOME
#fi

PATH=/home/jwhendy/.texlive/2013/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/home/jwhendy/.texlive/2013/texmf/doc/man:$MANPATH; export MANPATH 
INFOPATH=/home/jwhendy/.texlive/2013/texmf/doc/info:$INFOPATH; export INFOPATH
