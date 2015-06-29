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

# Use local zshrc if available
if [ -r ~/.zshrc.local ]
then
    # background color for terminal: #1C1C1C
    source ~/.zshrc.local
fi
