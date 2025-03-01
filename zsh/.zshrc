# load .aliases
[ -f $HOME/.zsh/.aliases ] && source $HOME/.zsh/.aliases

# load .functions
[ -f $HOME/.zsh/.functions ] && source $HOME/.zsh/.functions

# history
export HISTSIZE=1000
export SAVEHIST=1000000
export HISTFILE=$HOME/.zsh_history
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

# Complement
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2
setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt interactive_comments
setopt magic_equal_subst
setopt complete_in_word
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# highlight
zle_highlight=('paste:none')

# nobeep
setopt no_beep
setopt nolistbeep

# dir stack
setopt AUTO_PUSHD

# sheldon 読み込み
export SHELDON_CONFIG_FILE=$HOME/.sheldon.toml
eval "$(sheldon source)"

# Auto start tmux
if [[ -z $TMUX && $- == *l* && -n $SSH_TTY &&  ! $TERM_PROGRAM == vscode ]]; then
    type tmux > /dev/null 2>&1 && tmux attach || tmux
fi


# load pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# prompt with kube context
source "$(brew --prefix)/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='$(kube_ps1)'$'\n'$PROMPT
