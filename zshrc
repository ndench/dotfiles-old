#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# If a pattern for filename generation doesn't match
# pass it onto the command. Allows HEAD^ to work as
# expected.
setopt NO_NOMATCH

# Don't allow extra curly brace expansion. ie. turn off:
# echo {a-d} // {a-d}
# echo {a..d} // a b c d
# echo {1-4} // {1-4}
# echo {1..4} // 1 2 3 4
# This allows reference to the git stash with stash@{0} otherwise you have to 
# escape the curly braces.
unsetopt BRACE_CCL

# Set 256 colors
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# Use local zshrc if available
if [ -r ~/.zshrc.local ]
then
    # background color for terminal: #1C1C1C
    source ~/.zshrc.local
fi

export EDITOR=vim
export PATH=$PATH:~/bin
fpath=(~/.zsh/completion $fpath)
