# homebrew
if status --is-interactive
  eval (/usr/local/bin/brew shellenv)
end
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_ENV_HINTS 1

# editor
alias vi    'nvim'
alias vim   'nvim'
alias view  'nvim -R'
set -x EDITOR nvim
set -x VISUAL $EDITOR

# path mods
set -x PATH $HOME/.local/bin $PATH
