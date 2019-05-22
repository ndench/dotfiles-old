alias tf=terraform
alias myip="curl --silent ifconfig.co | xsel -b"

# Base16 Shell
if status --is-interactive
    source $HOME/dotfiles/base16/base16-shell/profile_helper.fish
end

# Vim mode - but inherit default key bindings too
fish_hybrid_key_bindings
