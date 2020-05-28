# =============================================================================
#
# File: $HOME/.bashrc
# By Andrew Mort
#
# Last modified: 10/31/2017
#
# =============================================================================

source ~/.dotfiles/misc/mintty-colors-solarized/mintty-solarized-dark.sh
export SHELL_COLOR="SOLARIZED_DARK"
#source ~/.dotfiles/misc/mintty-colors-solarized/mintty-solarized-light.sh
#export SHELL_COLOR="SOLARIZED_LIGHT"

if [ -e ${HOME}/.bashrc.user ]; then
  source ${HOME}/.bashrc.user
fi
