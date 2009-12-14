#!/bin/bash

# -------------------------------------------------------------------------
# SHELL VARIABLES
# -------------------------------------------------------------------------

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}


# -------------------------------------------------------------------------
# SHELL SETUP
# -------------------------------------------------------------------------

# bring in system bashrc
test -r /etc/bashrc && . /etc/bashrc
      
# notify of bg job completion immediately
set -o notify

# default umask
umask 0022

# bring in aliases
test -r "$HOME/.aliases" && . $HOME/.aliases


# -------------------------------------------------------------------------
# PATH & MANPATH
# -------------------------------------------------------------------------

# critical macports paths
test -d "/opt/local/bin" && PATH="$PATH:/opt/local/bin"
test -d "/opt/local/bin" && PATH="$PATH:/opt/local/sbin"
test -d "/opt/local/share/man" && MANPATH="/opt/local/share/man:$MANPATH"

# include our custom scripts
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# include mysql executables
test -d "/usr/local/mysql/bin" && PATH="/usr/local/mysql/bin:$PATH"
test -d "/usr/local/mysql/share/man" && MANPATH="/usr/local/mysql/share/man:$MANPATH"

# include subversion client 
test -d "/opt/subversion/bin" && PATH="/opt/subversion/bin:$PATH"
test -d "/opt/subversion/man" && MANPATH="/opt/subversion/man:$MANPATH"

# include current directory
PATH=".:$PATH"


# -------------------------------------------------------------------------
# ENVIRONMENT
# -------------------------------------------------------------------------

# virtualenv wrapper
if test -r "$HOME/bin/virtualenvwrapper_bashrc" ; then
    test -d "$HOME/.virtualenvs" || mkdir "$HOME/.virtualenvs"
    export WORKON_HOME="$HOME/.virtualenvs"
    . "$HOME/bin/virtualenvwrapper_bashrc"
fi

# java & related services and utilities
if [ "$UNAME" = Darwin ]; then
    export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
fi


# -------------------------------------------------------------------------
# PAGER & EDITOR
# -------------------------------------------------------------------------

# EDITOR
test -n "$(command -v vim)" && EDITOR=vim || EDITOR=vi
export EDITOR

# PAGER
if test -n "$(command -v less)" ; then
    PAGER="less -FirSwX"
    MANPAGER="less -FiRswX"
else
    PAGER=more
    MANPAGER="$PAGER"
fi
export PAGER MANPAGER


# -------------------------------------------------------------------------
# CUSTOM FUNCTIONS
# -------------------------------------------------------------------------

# go into our dev environment
function dev {
    cd "$HOME/dev/$1"
}

# markdown
function md {
    now=`date +"%Y%m%d-%H%M%S"`

    perl $HOME/bin/Markdown.pl --html4tags $* > /tmp/$now.html
    cat $HOME/.markdown/head.html /tmp/$now.html $HOME/.markdown/foot.html

    rm /tmp/$now.html
}

# pretty prompt for git
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\u@\h:\W \$(parse_git_branch)$ "

# distribute ssh keys
push_ssh_cert(){
    local _host
    test -f ~/.ssh/id_dsa.pub || ssh-keygen -t dsa
    for _host in "$@";
    do
        echo $_host
        ssh $_host 'cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_dsa.pub
    done
}


# -------------------------------------------------------------------------
# bring in other dev environments
# -------------------------------------------------------------------------

# carbon mountain
test -r "$HOME/dev/cmtn/bin/commands.sh" && . $HOME/dev/cmtn/bin/commands.sh

