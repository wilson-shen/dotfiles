# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

unsetopt beep
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[[ -f ~/.zaliases ]] && . ~/.zaliases

source <(fzf --zsh)

# Activate syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Disable underline
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Activate autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='nvim'
export VISUAL='nvim'

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Flutter
export PATH="$PATH:$HOME/development/flutter/bin"

# Android command line tools
export PATH="$PATH:$HOME/development/android/cmdline-tools/latest/bin"

# Android Emulator
export PATH="$PATH:$HOME/development/android/emulator"

# Android platform tools
export PATH="$PATH:$HOME/development/android/platform-tools"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# CSharp LS
export PATH="$PATH:/home/shen/.dotnet/tools" 

# Starship
eval "$(starship init zsh)"
