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

# Set brew path
if [ "$(which brew)" == "" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set vscode path
if [ "$(which code)" == "" ]; then
  export PATH="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH"
fi

# Set mise path
if [ "$(which mise)" != "" ]; then
  eval "$(mise activate bash)"
fi

# Change git path to brew git
GIT_PATH=$(brew --prefix)/bin/git
export PATH="$GIT_PATH:$PATH"

