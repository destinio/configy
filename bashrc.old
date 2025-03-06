# Turn vi mode on for bash
set -o vi

# =====================
# PATH Configuration
# =====================
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.pyenv/bin:$GOPATH/bin:$HOME/.cargo/bin:$PATH"

# Silence macOS bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

export EDITOR=nvim
export TZ=America/Chicago
export TZ_WORK=America/New_York # change to your remote TZ
export LANG=en_US.UTF-8
export PROJECTS="$HOME/projects"
export LESS=-R

# =====================
# Interactive Shell Check
# =====================
case $- in
*i*) ;;
*) return ;;
esac

# =====================
# History Settings
# =====================
HISTCONTROL=ignoreboth # No duplicate or space-prefixed entries
shopt -s histappend    # Append history instead of overwriting
HISTSIZE=1000
HISTFILESIZE=2000

# =====================
# Terminal and Colors
# =====================
export TERM=xterm-256color
shopt -s checkwinsize

# Enable color support for `ls`, `grep`, etc.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# =====================
# Prompt Customization
# =====================
if [[ "$TERM" =~ (xterm-color|.*-256color) ]]; then
  color_prompt=yes
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# =====================
# FZF Configuration
# =====================
export FZF_DEFAULT_OPTS="--reverse --border=sharp --border-label='LOVE <3' --border-label-pos=-3:bottom --inline-info --height=25 --tabstop=2"
alias fzf='fzf --preview="batcat --color=always {}"'

# Enable fzf key bindings and completion
if command -v fzf >/dev/null; then
  eval "$(fzf --bash)"
fi

# =====================
# Bash Completion
# =====================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# =====================
# Environment Managers
# =====================
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# =====================
# Node Version Manager (NVM)
# =====================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# =====================
# Rust (Cargo)
# =====================
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# =====================
# PHP Herd-Lite
# =====================
export PATH="$HOME/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="$HOME/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# test

# =====================
if [[ -f ~/.aliases ]]; then
  source ~/.aliases
fi
