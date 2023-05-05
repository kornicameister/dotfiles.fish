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

# prompt (hydro)
set hydro_color_prompt yellow
set hydro_color_pwd	blue
set hydro_color_git	red
set hydro_fetch true

# fzf
set fzf_preview_dir_cmd exa --all --color=always
set fzf_preview_file_cmd bat -n
set fzf_fd_opts --hidden --exclude=.git
