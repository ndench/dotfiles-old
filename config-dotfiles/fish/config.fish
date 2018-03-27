alias packer=packer-io
alias done='pactl set-sink-mute @DEFAULT_SINK@ off; and pactl set-sink-volume @DEFAULT_SINK@ 100%; and espeak done > /dev/null 2>&1'

# Base16 Shell
if status --is-interactive
    source $HOME/dotfiles/base16/base16-shell/profile_helper.fish
end
