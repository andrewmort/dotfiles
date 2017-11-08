# =============================================================================
#
# File: $HOME/.bashrc
# By Andrew Mort
#
# Last modified: 10/31/2017
#
# =============================================================================

# -----------------------------------------------------------------------------
# Determine system we are running 
# -----------------------------------------------------------------------------

unameOut="$(uname -s)"
case "$unameOut" in 
   Linux*)  machine="linux";;
   Darwin*) machine="mac";;
   CYGWIN*) machine="cygwin";;
   *)       machine="UNKNOWN";;
esac

# If we have brew installed on mac, change system type
if [ $machine == "mac" ]; then
   if hash brew 2> /dev/null; then
      machine="brew"

      # Add brew coreutils to path to override bsd versions with OSX
      PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
      MANPATH="$(brew --prefix coreutils)/libexec/gnuman:${MANPATH-usr/share/man}"
      export MANPATH=$MANPATH
   fi
fi


# -----------------------------------------------------------------------------
# SHELL is not always set, so do this
# -----------------------------------------------------------------------------

# Ensure shell variable is updated with correct shell
export SHELL=/bin/bash


# -----------------------------------------------------------------------------
# General settings
# -----------------------------------------------------------------------------

export EDITOR=vim

# Force bash to check for window size (prevent weird line wrapping)
shopt -s checkwinsize

# -----------------------------------------------------------------------------
# Set shell colors to use Solarized theme if available
# -----------------------------------------------------------------------------

# See if dircolors exists, then set dircolors
if hash dircolors 2> /dev/null; then
   if [ -f ~/.dircolors ]; then
      eval "$(dircolors ~/.dircolors)"
   fi
fi

force_color_prompt=yes

# -----------------------------------------------------------------------------
# Enable auto-completion for various commands
# -----------------------------------------------------------------------------

if [ -d /etc/bash_completion.d ]; then
   for file in /etc/bash_completion.d/* ; do
      source "$file"
   done
fi

# -----------------------------------------------------------------------------
# Set bash to append history
# -----------------------------------------------------------------------------

HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
shopt -s histappend # append to history file

# -----------------------------------------------------------------------------
# Set alias
# -----------------------------------------------------------------------------

# Use color with common commands
if [ $machine == "mac" ]; then
   alias ls="ls -G"
else
   alias ls="ls --color=auto"
fi

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias cp="cp -i"
alias mv="mv -i"

alias ..="cd .."
alias cd..="cd .."

# Add MVU aliases
alias mvu='/cad/adi/cadlib/models/programs/mvu/mvu'
alias mvum='/cad/adi/cadlib/models/programs/mvu/mvum'

# Add adice setup aliases
alias mksim='~/adice/current/programs/mksim.sh'
alias cpsim='~/adice/current/programs/cpsim.sh'
alias rsfailed='~/adice/current/programs/rsfailed.sh'


# -----------------------------------------------------------------------------
# Set prompt
# -----------------------------------------------------------------------------

# Define solarized colors
COLOR_BASE03='\[\e[01;30m\]'
COLOR_BASE02='\[\e[00;30m\]'
COLOR_BASE01='\[\e[01;32m\]'
COLOR_BASE00='\[\e[01;33m\]'
COLOR_BASE0='\[\e[01;34m\]'
COLOR_BASE1='\[\e[01;36m\]'
COLOR_BASE2='\[\e[00;37m\]'
COLOR_BASE3='\[\e[01;37m\]'
COLOR_YELLOW='\[\e[00;33m\]'
COLOR_ORANGE='\[\e[01;31m\]'
COLOR_RED='\[\e[00;31m\]'
COLOR_MAGENTA='\[\e[00;35m\]'
COLOR_VIOLET='\[\e[01;35m\]'
COLOR_BLUE='\[\e[00;34m\]'
COLOR_CYAN='\[\e[00;36m\]'
COLOR_GREEN='\[\e[00;32m\]'

# Define prompt color usage
COLOR_RESET=${COLOR_BASE0}
COLOR_TIME=${COLOR_BASE01}
COLOR_USER=${COLOR_BASE0}
COLOR_PATH=${COLOR_BASE1}
COLOR_PROMPT=${COLOR_BLUE}

# Clear settings
PS1=""

# Add time (24-hour, without seconds)
PS1="${PS1}${COLOR_TIME}\A${COLOR_RESET} "

# Add command return indicator (✔ if true, ✘ if false)
#TEMP="if [ \$? = 0 ]; then echo \"${COLOR_GREEN}✔ \"; else echo \"${COLOR_RED}✘ \"; fi"
#PS1="${PS1}\`${TEMP}\`${COLOR_RESET}"

# Add username@hostname
PS1="${PS1}${COLOR_USER}\u@\h${COLOR_RESET}:"

# Add current working path
PS1="${PS1}${COLOR_PATH}\W${COLOR_RESET}"

# Add git branch and status if in git directory
if type -t __git_ps1 &> /dev/null; then
   PS1="$PS1"'$(__git_ps1 " (%s)")'

   # Unstaged (*) and staged (+) changes will be shown next to branch name
   export GIT_PS1_SHOWDIRTYSTATE="yes"

   # Stashed ($) changes will be shown next to branch name
   export GIT_PS1_SHOWSTASHSTATE="yes"
   
   # Untacked (%) changes will be shown next to branch name
   export GIT_PS1_SHOWUNTRACKEDFILES="yes"

   # Modifies the way detached HEAD is shown
   #  contains: looks forward in tree for tag
   #  branch: looks forward in tree for a tag or branch
   #  describe: looks backwards in tree for a tag
   #  default: display tag you're exactly on, otherwise show commit id
   export GIT_PS1_DESCRIBE_STYLE="contains"

   # Shows the difference between server and local branch (git fetch)
   #  <  behind    (need to pull changes from server)
   #  >  ahead     (need to push changes to server)
   #  <> divergent (some conflict resolution required)
   #  =  identical (no action needed)
   export GIT_PS1_SHOWUPSTREAM="auto"
fi

# Add prompt indicator
PS1="${PS1}${COLOR_PROMPT}>${COLOR_RESET} " 

