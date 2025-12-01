export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode disabled  # disable automatic updates

HIST_STAMPS="dd-mm-yyyy"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

XDG_CONFIG_HOME="$HOME/.config"

export PATH=$PATH:~/libs/zig
