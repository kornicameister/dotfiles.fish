# homebrew
if status --is-interactive
  eval (/usr/local/bin/brew shellenv)
end
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_ENV_HINTS 1
