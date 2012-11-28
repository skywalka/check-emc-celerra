# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
unset USERNAME
NAS_DB=/nas
export NAS_DB
MANPATH=/usr/share/man:/usr/man:$NAS_DB/man
export MANPATH
PATH=$PATH:$NAS_DB/bin
export PATH
#/nasmcd/.emc_login
alias useradd='echo Please use Celerra Manager for User/Group management.' 
alias userdel='echo Please use Celerra Manager for User/Group management.' 
alias usermod='echo Please use Celerra Manager for User/Group management.' 
alias groupadd='echo Please use Celerra Manager for User/Group management.' 
alias groupdel='echo Please use Celerra Manager for User/Group management.' 
alias groupmod='echo Please use Celerra Manager for User/Group management.' 
