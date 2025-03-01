# Language
if [[ -z "$LANG" ]]; then
    export LANG='ja_JP.UTF-8'
fi


export PATH="$HOME/.local/share/mise/shims:$PATH"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "/usr/local/bin" ] ; then
    PATH="/usr/local/bin:$PATH"
fi

# Set brew path
if [ -z "$(command -v brew)" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# prioritize brew path (brew 管理の git などを優先させるため)
export PATH="/opt/homebrew/bin/:$PATH"

# Set vscode path
if [ -z "$(command -v code)" ]; then
  export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"
fi

# Set mise path
if [ -n "$(command -v mise)" ]; then
  eval "$(mise activate zsh)"
fi
export PATH="$HOME/.local/share/mise/shims:$PATH"
