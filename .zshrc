# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="ainzzorl"
DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX=true

plugins=(git)
source $ZSH/oh-my-zsh.sh

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \W\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi

export GREP_OPTIONS='--color=auto'
export HOMEBREW_NO_ANALYTICS=1
export EDITOR="vim"

# http://bashrcgenerator.com/
#export PS1="\[\033[38;5;14m\]\u@\h \w> \[$(tput sgr0)\]"

#ZSH_THEME="bobbyrussell"
# ZSH_THEME="eastwood"
# eastwood

git config --global pager.branch false
git config --global pager.diff true
git config --global core.editor "vim"

setopt rmstarsilent

source $HOME/env/.bashrc_functions
source $HOME/env/.bashrc_aliases

if [[ $OSTYPE == 'darwin'* ]]; then
  source $HOME/env/.bashrc_mac
fi

# if [ -d $HOME/.rvm ];
# then
#    source $HOME/env/.bashrc_ruby
# fi

# Allows customization per environment.
if [ -f $HOME/env/.bashrc_local ];
then
   source $HOME/env/.bashrc_local
fi

if [ "$ENABLE_AUTO_VENV" = "true" ]; then
    export VENVDIR=""

    if [ -d $PWD/.venv ]; then
        export VENVDIR=$PWD
        source .venv/bin/activate
    fi

    cd() { builtin cd "$@" &&
    if [ -d $PWD/.venv ]; then
        export VENVDIR=$PWD
        source .venv/bin/activate
    elif [ "$VENVDIR" ]; then
        if [[ $PWD != *"$VENVDIR"* ]]; then
        export VENVDIR=""
        deactivate
        fi
    fi }
fi

if [ -d "$HOME/.rvm/bin" ]; then
  export PATH="$PATH:$HOME/.rvm/bin"
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

source $HOME/env/.git_shortcuts

export PATH="$PATH:$HOME/.local/bin"
