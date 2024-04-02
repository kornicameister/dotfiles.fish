# theme
fish_config theme choose "Dracula Official"

# GPG
export GPG_TTY=$(tty)

# homebrew
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_ENV_HINTS 1
status --is-interactive ; and brew shellenv | source

# Python variables
set -x PYTHONIOENCODING         'UTF-8'     #  make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
set -x PYTHONUTF8               1           # ---/---
set -x PYTHONDONTWRITEBYTECODE  1           # prevent Python from making .pyc files that may become stale and cause weird bugs

# Docker
set -x DOCKER_BUILDKIT          1

# Prefer US English and use UTF-8.
set -x LANG   'en_US.UTF-8';
set -x LC_ALL 'en_US.UTF-8';

# editor
set -x EDITOR nvim
set -x VISUAL $EDITOR

# path mods
set -x PATH $HOME/.local/bin $PATH

# z, j
zoxide init fish --cmd j --hook pwd | source

# fzf
fzf_configure_bindings \
  --directory=\ct \
  --variables=\cv \
  --history=\cr \
  --processes=\cp \
  --git_status=\cs \
  --git_log=\cl

set fzf_directory_opts    --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
set fzf_history_opts      --no-sort
set fzf_preview_dir_cmd   exa --icons --all --color=always
set fzf_preview_file_cmd  preview
set fzf_fd_opts           --hidden --exclude=.git

# awsume
test ! -e ~/.config/fish/functions/awsume.fish && awsume-configure --shell fish
abbr -a -g ay awsume

# all *env
set -x PYENV_ROOT	"$HOME/.pyenv"
set -x PATH 		"$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

set -x GOENV_ROOT   "$HOME/.goenv"
set -x PATH         "$GOENV_ROOT/bin" $PATH
status --is-interactive; and . (goenv init -|psub)

set -x NODENV_ROOT  "$HOME/.nodenv"
set -x PATH         "$NODENV_ROOT/bin" $PATH
status --is-interactive; and . (nodenv init -|psub)

set -x JENV_ROOT    "$HOME/.jenv"
set -x PATH         "$JENV_ROOT/bin" $PATH
status --is-interactive; and . (jenv init -|psub)

set -x RBENV_ROOT   "$HOME/.rbenv"
set -x PATH         "$RBENV_ROOT/bin" $PATH
status --is-interactive; and . (rbenv init -|psub)

status --is-interactive; and direnv hook fish | source

# iterm2
test ! -e {$HOME}/.iterm2_shell_integration.fish && curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish
source ~/.iterm2_shell_integration.fish

# prompt
set pure_show_system_time true

# abbrevations, aliases and other mental shortcuts
abbr -a -g e 'nvim'
abbr -a -g g git
abbr -a -g o xdg-open
abbr -a -g r 'source ~/.config/fish/config.fish'
abbr -a -g v 'nvim'
alias vi      'nvim'
alias vim     'nvim'
alias view    'nvim -R'
alias ping    'prettyping --nolegend'
alias l       'exa -F --sort changed --icons -la --git --git-ignore'
alias ls      'exa -F --icons'
alias la      'exa -F --group-directories-first --icons -la'
alias ll      'exa -F --group-directories-first --icons -la --color-scale --time-style long-iso --git --git-ignore'
alias tree    'exa -F --group-directories-first -T --icons --level 2'
alias awsume  'source (which awsume.fish)'

abbr -a -g ga      'git amend'
abbr -a -g gc      'git commit'
abbr -a -g gcm     'git commit -m'
abbr -a -g gd      'git diff'
abbr -a -g gds     'git diff --staged'
abbr -a -g gf      'git fixup'
abbr -a -g gfa     'git fetch --all --prune --prune-tags'
abbr -a -g gia     'git add'
abbr -a -g gm      'git merge'
abbr -a -g gp      'git push'
abbr -a -g gr      'git rebase'
