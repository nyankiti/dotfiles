# 実際に実行されたコマンドを可視化
set -xe

# Homebrew のインストール
if [ $(uname) = Darwin ]; then
    if ! type brew &> /dev/null ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Since Homebrew is already installed, skip this phase and proceed."
    fi
    # TODO: Drawin(MazOS)以外の対応
else
    echo "Not macOS!"
	exit 1
fi

# Brewfileに記載されたパッケージをインストール
/opt/homebrew/bin/brew bundle install --file=Brewfile

# xcode のインストール
if ! xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools が見つかりません。インストールを開始します..."
    xcode-select --install
else
    echo "Xcode Command Line Tools はすでにインストールされています。"
fi

# ドットから始まる設定ファイルのシンボリックリンク作成
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
for dir in "${SCRIPT_DIR}"/*/ ; do
    # 特定のディレクトリは除外
    [[ "$dir" == "${SCRIPT_DIR}/.git/" ]] && continue
    [[ "$dir" == "${SCRIPT_DIR}/.github/" ]] && continue
        
    # ディレクトリ内の "." で始まるファイルを探索
    for dotfile in "${dir}".??* ; do
        # ファイルが存在する場合のみ処理
        if [[ -f "$dotfile" ]]; then
            # ターゲットパス
            TARGET_PATH="$HOME/$(basename "$dotfile")"
            # 既存ファイルのバックアップ作成
            if [[ -e "$TARGET_PATH" && ! -L "$TARGET_PATH" ]]; then
                echo "Backing up existing file: $TARGET_PATH -> ${TARGET_PATH}.backup.${TIMESTAMP}"
                mv "$TARGET_PATH" "${TARGET_PATH}.backup.${TIMESTAMP}"
            fi
            # シンボリックリンク作成
            ln -fnsv "$dotfile" "$HOME"
        fi
    done
done

# miseの設定を適用
ln -fsvn "${SCRIPT_DIR}/mise/mise.toml" "${HOME}/mise.toml"
if [ "$(which mise)" != "" ]; then
  mise install
else
  echo "Install the mise command"
fi


# miseのNode環境をグローバル化
if ! which node; then
    $(/opt/homebrew/bin/brew --prefix)/bin/mise use --global node
fi

# miseのPython環境をグローバル化
if ! which python; then
    $(/opt/homebrew/bin/brew --prefix)/bin/mise use --global python
fi


echo "セットアップが完了しました"
echo "Next..."
echo "1. git/user.confを追加し、ユーザー情報を設定してください。"
echo "2. ターミナルを再起動してください。"
echo "3. Raycastの設定をimportしてください。"
echo "4. ssh周りの設定を行ってください。"