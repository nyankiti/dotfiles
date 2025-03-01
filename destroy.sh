# 実際に実行されたコマンドを可視化
set -xe

# mise関連のアンインストール
if which mise; then
    mise implode -y
fi

# Homebrew のアンインストール
if type brew &> /dev/null ; then
    echo 'Y' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
[[ -e /opt/homebrew ]] && sudo /bin/rm -fr /opt/homebrew


# remove cache
/bin/rm -fr $HOME/.cache