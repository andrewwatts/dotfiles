#!/bin/bash


# -------------------------------------------------------------------------
# This is my .bashrc, a lot of the format and ideas were borrowed from
# http://github.com/rtomayko/dotfiles/blob/rtomayko/.bashrc.  Although, 
# I have heavily customized for my environment.
# -------------------------------------------------------------------------


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


# -------------------------------------------------------------------------
# PATH & MANPATH
# -------------------------------------------------------------------------

# usr/local/sbin
test -d "/usr/local/sbin" && PATH="$PATH:/usr/local/sbin"

# critical homebrew path
if test -n "$(command -v brew)" ; then
    PATH="/usr/local/bin:$PATH"
else
# critical macports paths
    test -d "/opt/local/bin" && PATH="/opt/local/bin:$PATH"
    test -d "/opt/local/sbin" && PATH="/opt/local/sbin:$PATH"
    test -d "/opt/local/share/man" && MANPATH="/opt/local/share/man:$MANPATH"
fi

# include our custom scripts
test -d "$HOME/bin" && PATH="$HOME/bin:$PATH"

# include our ruby gems
test -d "$HOME/.gem/ruby/1.8/bin" && PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# include mysql executables for custom mysql installation
test -d "/usr/local/mysql/bin" && PATH="/usr/local/mysql/bin:$PATH"
test -d "/usr/local/mysql/share/man" && MANPATH="/usr/local/mysql/share/man:$MANPATH"

# include subversion client for custme svn installation
test -d "/opt/subversion/bin" && PATH="/opt/subversion/bin:$PATH"
test -d "/opt/subversion/man" && MANPATH="/opt/subversion/man:$MANPATH"

# include current directory
PATH=".:$PATH"


# -------------------------------------------------------------------------
# ENVIRONMENT
# -------------------------------------------------------------------------

# virtualenv wrapper
if test -r "/usr/local/bin/virtualenvwrapper.sh" ; then
    test -d "$HOME/.virtualenvs" || mkdir "$HOME/.virtualenvs"
    export WORKON_HOME="$HOME/.virtualenvs"
    export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"
    . "/usr/local/bin/virtualenvwrapper.sh"
fi

# git helper functions
if test -r "$HOME/bin/git_bashrc" ; then
    . "$HOME/bin/git_bashrc"
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
# LS AND DIRCOLORS (from http://github.com/rtomayko/dotfiles/)
# -------------------------------------------------------------------------

# we always pass these to ls(1)
LS_COMMON="--color=auto -hB"
#LS_COMMON="-hBG"

# setup the main ls alias if we've established common args
test -n "$LS_COMMON" &&
    alias ls="command ls $LS_COMMON"
 
# if the dircolors utility is available, set that up to
dircolors="$(type -P gdircolors dircolors | head -1)"
test -n "$dircolors" && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM"   && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors"        && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS"               && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# -------------------------------------------------------------------------
# PROMPT HAWTNESS
# -------------------------------------------------------------------------

test -r "$HOME/bin/prompt_bashrc" && . $HOME/bin/prompt_bashrc


# -------------------------------------------------------------------------
# CUSTOM ALIASES FUNCTIONS
# -------------------------------------------------------------------------

# bring in aliases
test -r "$HOME/.aliases" && . $HOME/.aliases

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

# distribute ssh keys
# from http://github.com/rtomayko/dotfiles/.bashrc
push_ssh_cert(){
    local _host
    test -f ~/.ssh/id_dsa.pub || ssh-keygen -t dsa
    for _host in "$@";
    do
        echo $_host
        ssh $_host 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys' < ~/.ssh/id_dsa.pub
    done
}

# OSX specific functions
if [ "$UNAME" = Darwin ] && [ "$TERM_PROGRAM" = Apple_Terminal ]; then
    
    # change the color of our ssh'd terminal
    test -r "$HOME/bin/SetTerminalStyle" && {
        function ssh {
            $HOME/bin/SetTerminalStyle ssh
            /usr/bin/ssh "$@"
            $HOME/bin/SetTerminalStyle default 
        }
    }

    # change the color of a mysql terminal
    test -r "$HOME/bin/SetTerminalStyle" && {
        function mysql {
            $HOME/bin/SetTerminalStyle Ocean
            /usr/local/bin/mysql "$@"
            $HOME/bin/SetTerminalStyle default
        }
    }
    
fi



# -------------------------------------------------------------------------
# bring in other dev environments
# -------------------------------------------------------------------------

# django
test -r "$HOME/bin/django_bash_completion" && . $HOME/bin/django_bash_completion

# carbon mountain
test -r "$HOME/dev/cmtn/bin/commands.sh" && . $HOME/dev/cmtn/bin/commands.sh

# truecar
test -r "$HOME/dev/tc/bin/commands.sh" && . $HOME/dev/tc/bin/commands.sh

# ec2
test -L "$HOME/dev/ec2" && {
    export EC2_HOME="$HOME/dev/ec2"
    PATH="$PATH:$EC2_HOME/bin"
}
test -L "$HOME/dev/elb" && {
    export AWS_ELB_HOME="$HOME/dev/elb"
    PATH="$PATH:$AWS_ELB_HOME/bin"
}
test -L "$HOME/dev/iam" && {
    export AWS_IAM_HOME="$HOME/dev/iam"
    PATH="$PATH:$AWS_IAM_HOME/bin"
}
