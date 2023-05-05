# theme
fish_config theme choose "Dracula Official"

# homebrew
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_ENV_HINTS 1

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
if status --is-interactive
  type -q brew; and brew shellenv | source
  type -q rbenv; and source (rbenv init -|psub)
  type -q nodenv; and source (nodenv init -|psub)
  type -q goenv; and source (goenv init -|psub)
  type -q pyenv; and source (pyenv init - --path --no-rehash fish |psub)
  type -q direnv; and direnv hook fish | source
end

# iterm2
test ! -e {$HOME}/.iterm2_shell_integration.fish && curl -L https://iterm2.com/shell_integration/fish -o ~/.iterm2_shell_integration.fish
source ~/.iterm2_shell_integration.fish

# prompt
starship init fish | source

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
alias tree    'exa -F --group-directories-first -T --icons --level       2'
alias awsume  'source (which awsume.fish)'
