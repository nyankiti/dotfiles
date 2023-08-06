## 参考
- https://github.com/moisutsu/dotfiles-template/tree/main
- [ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164)
- [pecoを使って端末操作を爆速にする](https://qiita.com/reireias/items/fd96d67ccf1fdffb24ed)
- [Mac の環境を dotfiles でセットアップしてみた(2023 年度版)](https://zenn.dev/tsukuboshi/articles/6e82aef942d9af)
- https://github.com/tsukuboshi/dotfiles/tree/26c2fd1a315a34bf38fdab9ed0dce8b0d52ddf32


## 一般的なdotfiles関連の情報収集ができるサイト
- GitHub topicのdotfiles https://github.com/topics/dotfiles
- Redditのr/doftiles, r/commandline, 自分の使っているシェル (例: r/zsh)
- vim-jpのSlack dotfilesチャンネル https://vim-jp.org/docs/chat.html に招待リンクがあります (今のところ専用のコミュニティスペースがない+人がどれくらい集まるかもわからないため、またvimmerにdotfilesが多かったため間借りしています。。。)


### ※ 日々の作業の中でもう少し改善できないかな？、未来で楽をするために今できることはないかなと考え続ける心が最も大事。



```
dotfiles
├── .bin/ # dotfilesのインストールスクリプトとよく使う自作スクリプトを格納する
│   ├── make_conkyrc.sh*
│   ├── arch-extra-setup.sh* # メインで使っているOSの追加のインストールスクリプト
│   └── install.sh* # dotfilesのインストールスクリプト
├── .bin.local/ # .localがつくものはその環境でしか使わないものを格納する
│   └── .gitkeep
├── .config/
│   ├── alacritty/ # ターミナルの設定ファイル
│   │   └── alacritty.yml
│   ├── Code/ # みんなが大好きなVSCodeの設定ファイル
│   │   ├── _install.sh* # だけどインストールした直後に設定が作られるためdotfilesとしては管理しずらいのでインストールスクリプトを用意しておく
│   │   └── User/
│   │       ├── keybindings.json
│   │       └── settings.json
│   ├── nvim -> ../.vim/
│   └── systemd/ # ユーザー用のsystemdの常駐設定も管理しておくと便利
│       └── user/
│           └── i3-cycle-focus.service
├── .gdbinit
├── .github/
│   └── workflows/
│       └── test.yml
├── .gitignore
├── .gitignore_global # よく誤コミットしてしまう `*~` や `.vscode` や `.DS_Store` を記載する
├── .gitconfig_shared # よく使うaliasやcolor設定、`excludesfile = ~/.gitignore_global` を記載する
├── .i3/ # デスクトップ環境の設定ファイル
│   ├── config
│   └── i3blocks.conf
├── .ideavimrc
├── LICENSE
├── README.md
├── .tmux/
│   ├── conf/ # 行数が増えた設定ファイルで外部ファイルを読み込めるものは設定ごとに分割したほうが見通しがよくなる
│   │   ├── base.tmux*
│   │   ├── bind.tmux*
│   │   ├── color.tmux*
│   │   └── plugin.tmux*
│   └── log/
├── .tmux.conf
├── .vim/
│   ├── after/
│   │   ├── ftplugin/
│   │   └── .gitkeep
│   ├── backup/
│   ├── coc-settings.json
│   ├── ftdetect/
│   ├── ftplugin/
│   ├── info/
│   │   └── .gitkeep
│   ├── init.vim -> ../.vimrc
│   ├── rc/
│   │   ├── autocmd.vim
│   │   ├── base.nvim
│   │   ├── base.vim
│   │   ├── coloring.vim
│   │   ├── command.vim
│   │   ├── display.vim
│   │   ├── init.vim
│   │   ├── keyconfig.vim
│   │   ├── mappings.vim
│   │   ├── pluginconfig.vim
│   │   ├── pluginlist.vim
│   │   └── statusline.vim
│   ├── sessions/
│   │   └── .gitkeep
│   ├── snippets/
│   │   └── .gitkeep
│   ├── swap/ # 使用しているときに一時ファイルができるディレクトリは後述のgitignoreの設定で差分が発生しないように管理する
│   │   └── .gitkeep
│   ├── template/
│   │   └── .gitkeep
│   └── undo/
│       └── .gitkeep
├── .vimrc
├── .xinitrc
├── .Xmodmap
├── .xprofile*
├── .Xresources
├── .xsessionrc
├── .zfunc/
│   └── .gitkeep
├── .zsh/
│   ├── completion/
│   │   └── .gitkeep
│   ├── dircolors
│   └── rc/
│       ├── alias.zsh
│       ├── base.zsh
│       ├── bindkey.zsh
│       ├── commandconfig.zsh
│       ├── completion.zsh
│       ├── function.zsh
│       ├── option.zsh
│       ├── pluginconfig/
│       ├── pluginlist.zsh
│       └── prompt.zsh
├── .zshenv
└── .zshrc

```