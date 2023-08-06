# Do everything.
all: init link defaults brew

# brew, Xcodeなどのインストールが終了していない場合こちらを先に実行
init:
	init.sh

# dotfilesのシンボリックリンクをホームディレクトリに作成
link:
	link.sh

# Set macOS system preferences.
defaults:
	.bin/defaults.sh

# Install macOS applications.
brew:
	.bin/brew.sh