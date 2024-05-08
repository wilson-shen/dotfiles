parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)\n/'
}
if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;92m\]\u@\h \[\033[01;94m\]\W \[\033[01;91m\]$(parse_git_branch)\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h \W $(parse_git_branch)\$ '
fi
# unset color_prompt force_color_prompt

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

# Copy Rust environment variables
. "$HOME/.cargo/env"
