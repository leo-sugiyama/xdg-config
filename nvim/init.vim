"----------------------------------------
" 一般設定
"----------------------------------------
" 内部の文字コード
set encoding=utf-8
" 読み込み時の文字コード
" 左から順番に試して最初に成功した文字コードで読み込み、 encoding の文字コードでバッファが開かれる
set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
" 書き込み時の文字コード
set fileencoding=utf-8
" 読み込み時の改行コード
set fileformats=dos,unix,mac
" 書き込み時の改行コード
if has("mac")
    set fileformat=mac
elseif (has("unix") || has("win32unix"))
    set filefomat=unix
elseif (has("win64") || has("win32"))
    set fileformat=dos
endif
" 外部でファイルが変更されたら読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" スワップファイルを作成しない
"set noswapfile
" バックアップファイルを作成しない
set nobackup
" ファイルを上書きする前の一時ファイルを作成しない
set nowritebackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
"set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
"set wildmenu
" エラーメッセージの表示時にビープを鳴らさない /
" ビープ音を視覚表示 (ビジュアルベル) に置き換える
"set noerrorbells
"set visualbell
" コマンドラインの履歴を10000件保存する
"set history=10000
" シンタックスハイライト
"syntax on

"----------------------------------------
" 表示設定
"----------------------------------------
" 行番号を表示
set number
" 現在の行を強調表示
"set cursorline
" 現在の列を強調表示
"set cursorcolumn
" 対応する括弧やブレースを表示
set showmatch
set matchtime=1
" メッセージ表示欄を2行確保
"set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" 補完メニューの高さ
set pumheight=10
" 空白やタブ、改行等の制御文字を表示
" tab     : タブ文字
" trail   : 行末のスペース
" eol     : 改行記号
" extends : ウィンドウ幅が狭くて右に省略された文字
" precedes: extends と同じで左に省略された文字
" nbsp    : 不可視のスペース
set list
set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%

"----------------------------------------
" 編集設定
"----------------------------------------
" C 言語風のプログラミング言語向けの自動インデント
set smartindent
" 入力モードでTabキー押下時に半角スペースを挿入
" 但し *makefile*,*Makefile* だけはタブ文字を挿入する
let _curfile=expand("%:r")
if _curfile =~ ".*[mM]akefile.*"
    set noexpandtab
else
    set expandtab
endif
" タブ文字の幅
set tabstop=4
" タブ文字の代わりに挿入する空白の幅
set softtabstop=4
" インデント幅
" オプション cindent やコマンド <<,>> 等に使われる
set shiftwidth=4
" ヤンクでクリップボードにコピー
set clipboard=unnamed
" 先頭に 0 が前置きされていても 10 進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 全てのモードでマウス利用可
"set mouse=a

"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" すべて小文字で検索すると大文字と小文字を無視して検索
" 大文字が入っていると大文字小文字を区別して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
" コマンドラインの補完
"set wildmode=list:longest

"---------------------------------------
" キーマッピング
"---------------------------------------
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" カーソル位置から行末までヤンク
nnoremap Y y$
" 仮想置換モードをデフォルトにする
nnoremap r gr
nnoremap R gR
if exists('g:vscode')
    nnoremap j      <Cmd>call VSCodeNotify('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
    nnoremap k      <Cmd>call VSCodeNotify('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
    nnoremap <Down> <Cmd>call VSCodeNotify('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
    nnoremap <Up>   <Cmd>call VSCodeNotify('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': v:count ? v:count : 1 })<CR>
else
    " 折り返し時に表示行単位での移動できるようにする
    nnoremap j      gj
    nnoremap k      gk
    nnoremap <Up>   gj
    nnoremap <Down> gk
endif
