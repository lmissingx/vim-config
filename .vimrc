" This is changed base on vimrc_example.vim 
" Maintainer: Kevin Xu <lmissingx@outlook.com>
" Last change 2022 Jul 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMs:  sys$login:.vimrc

" 禁用 vi 兼容模式
" Use Vim settings, rather than Vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set encoding=utf-8
scriptencoding utf-8

if &compatible
    set nocompatible
endif

if filereadable(expand("~/.vimrc.plugin"))
    source ~/.vimrc.plugin
endif

" Allow backspacing over everthing in insert mode
set backspace=indent,eol,start

set history=1000     " 保存1000条历史命令(keep 200 lines of command line history)
"set ruler       " 状态栏显示行列号(show the cursor position all the time)
set showcmd    " 状态栏显示正在输入的命令(display incomplete commandss)
"set showmode    " 左下角显示当前模式(show current mode down the botton.default: on)
set wildmenu    " (display completion matches in a status line)
set relativenumber number    " 显示行号和相对行号(display line number and relative number)
"set gcr=a:blinkon0    " The cursor should look like in different modes.fully works in the GUI
"set visualbell        " 关闭声音(No sounds)
set nowrap      " 不换行(Don't wrap lines)
"set autoread      " 外部修改后自动重新加载(Reload files changed outside vim)
"set clipboard=unnamed  " yank to the system register (*) by default

set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

set display=lastline
set cursorline  " 突出显示当前行(When there is a previous search pattern)
"set cursorcolumn

set showmatch  " When a bracket is inserted, briefly jump to the matching one.

" let g:mapleader='<Space>'
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
"set lazyredraw        " 延迟绘制（提升性能）


" ====================syntaxOn====================
" Switch syntax highlighting on when the terminal has colors or
" when using the GUI.
if &t_Co > 2 || has("gui_running")
    syntax enable
    syntax on

    set t_Co=256
    if has('gui_running')
        set background=light
    else
        set background=dark
    endif
    colorscheme hybrid

    " highlighting strings inside C comments.
    " Revert with ":unlet c_comment_strings".
    let c_comment_strings=1
endif

" ========================================
filetype on    " 检测文件类型()
filetype plugin on    " 允许插件()
filetype indent on    " 不同的文件类型采用不同的缩进格式()
filetype plugin indent on    " 启动自动补全()

" ====================Encoding====================
set encoding=utf-8    " 内部工作编码(set encoding used inside Vim)
set fileencoding=utf-8    " 文件默认编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1    " 打开文件时自动尝试下面顺序的编码
set formatoptions+=m    " 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=B    " 合并两行中文时，不在中间加空格
set ffs=unix,dos,mac    " 文件换行符，默认使用 unix 换行符


" ====================BackUp====================
set backup
set writebackup
if isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set backupdir=~/.vim/backups
    set backupext=.bak
    set noswapfile
    set noundofile
endif


" ====================Indent====================
set expandtab    " 把<Tab>转换成空格(Insert Mode,use spaces to insert a <Tab>)。需要Tab时,用Ctrl+V+Tab来插入Tab
set shiftwidth=4    " 每次缩进使用的空格数量(Number of spaces to use for each (auto)indent)
set tabstop=4        " 一个<Tab>相当于多少各空格(Number of spaces that a <Tab> in the file count for
" softtabstop: Number of spaces that a <Tab> counts for while
" performing editing operatoions. in fact mix of spaces and <Tab>s
set softtabstop=4    " 处于编辑模式时一个<Tab>计算的空格数

set textwidth=120    " 正在被编辑的文本的最大宽度(Text width maxmum chars before wrapping
set colorcolumn=+1,+2,+3    " 高亮最大宽度后面三列, (highlight column after 'textwidth')
" 设置colorcolumn列的颜色；例子 hi ColorColumn ctermbg=lightgrey guibg=lightgrey
" (cterbg和guibg都可用数字代表各种颜色) 例如：ctermbg=6 guibg=#000000
highlight ColorColumn ctermbg=6
"highlight StatusLine ctermbg=7

set cindent        " 使用C语言的缩进规则(Get the amount of indent for line according the C rules.
set autoindent      " 起新行时复制前一行的缩进(Copy indent from current line when starting a new line)


" ====================Search====================
set hlsearch    " search时，高亮匹配的字符(previous search pattern, highlight all its matches)
set ignorecase    " 搜索时忽略大小写进行匹配(Ignoring case in a pattern)
set smartcase    " 搜索包含大写字母时忽略大小写匹配(if search pattern contains upper case char,override 'ignorecase')
set incsearch    " 实时匹配键入的内容


" ====================Folding====================
if has('folding')
    set foldenable    " 允许代码折叠。使用zi命令触发(quickly switch between show all text unfolded and view text with flods)
    set foldmethod=indent    " 代码折叠默认使用缩进
    set foldlevel=99    " 默认打开所有缩进( 0: close all folds; positive: close some folds, 99: open all folds)
endif


" ====================Others====================
autocmd InsertEnter * :set norelativenumber number    " 插入模式用绝对行号
autocmd InsertLeave * :set relativenumber    " 其他模式用相对行号

"set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m  " 错误格式

set laststatus=2                                " 0:不显示状态行 1:仅窗口大于1时显示 2:总是显示状态行
set statusline=                                 " 清空状态了
set statusline+=%1*\ %F                           " 文件名
set statusline+=\ [%1*%M%*%n%R%H]               " buffer 编号和状态
"set statusline+=%0*\ \ %m%r%w\ %P\ \
set statusline+=%=                              " 向右对齐
set statusline+=%2*\ %y\                        " 文件类型
set statusline+=%4*\ %{&ff}\                    "文件系统(dos/unix..)
set statusline+=%5*\ [%{&spelllang}\%{HighlightSearch()}]\  "语言 & 是否高亮，H表示高亮?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)
set statusline+=%9*\ col:%03c\                            "光标所在列

function! HighlightSearch()
      if &hls
          return 'H'
      else
          return ''
      endif
endfunction
hi User1 ctermfg=white  ctermbg=darkred
hi User2 ctermfg=white  ctermbg=58
hi User3 ctermfg=white  ctermbg=100
hi User4 ctermfg=darkred  ctermbg=95
hi User5 ctermfg=darkred  ctermbg=77
hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold
hi User8 ctermfg=231  ctermbg=blue
"hi User9 ctermfg=#ffffff  ctermbg=#810085
hi User0 ctermfg=yellow  ctermbg=138

" 最右边显示文件编码和行号等信息，并且固定在一个 group 中，优先占位
" &ff: 显示文件格式(fileformat) [%0(%{&fenc}%)]:文件编码(fileencoding)
" %v/%c:当前列号(current column)
" %l:当前行号 %p:当前行占总行比率 %L:一共都多少行()
"set statusline+=\ %{&ff}/[%0(%{&fenc}%)]\ %c:%l[%p%%]/%L

"set statusline=
"set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "文件路径
"set statusline+=%2*\ %y\                                  "文件类型
"set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "编码1
"set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "编码2
"set statusline+=%4*\ %{&ff}\                              "文件系统(dos/unix..) 
"set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "语言 & 是否高亮，H表示高亮?
"set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "光标所在行号/总行数 (百分比)
"set statusline+=%9*\ col:%03c\                            "光标所在列
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Read only? Top/bottom
"function! HighlightSearch()
"      if &hls
"          return 'H'
"      else
"          return ''
"      endif
"endfunction
"hi User1 ctermfg=white  ctermbg=darkred
"hi User2 ctermfg=blue  ctermbg=58
"hi User3 ctermfg=white  ctermbg=100
"hi User4 ctermfg=darkred  ctermbg=95
"hi User5 ctermfg=darkred  ctermbg=77
"hi User7 ctermfg=darkred  ctermbg=blue  cterm=bold
"hi User8 ctermfg=231  ctermbg=blue
"hi User9 ctermfg=#ffffff  ctermbg=#810085
"hi User0 ctermfg=yellow  ctermbg=138



" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set listchars=tab:>-,trail:.,nbsp:%,extends:>,precedes:<    " 分隔符可视(display tabs and trailing spaces)

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" Specifies the key sequence that toggles the 'paste' option
" (sane indentation when 'paste' option) work in InsMode,Normode
set pastetoggle=<F11>

"----------------------------------------------------------------------
" 防止tmux下vim的背景色显示异常
" Refer: http://sunaku.github.io/vim-256color-bce.html
"----------------------------------------------------------------------
if &term =~ '256color' && $TMUX != ''
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

"----------------------------------------------------------------------
" 有 tmux 何没有的功能键超时（毫秒）
"----------------------------------------------------------------------
if $TMUX != ''
	set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
	set ttimeoutlen=80
endif

" 打开文件时恢复上一次光标所在位置
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" 定义一个 DiffOrig 命令用于查看文件改动
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

" ====================Security====================
set modelines=0
set nomodeline


" ====================文件类型微调====================
augroup InitFileTypesGroup

	" 清除同组的历史 autocommand
	au!

	" C/C++ 文件使用 // 作为注释
	au FileType c,cpp setlocal commentstring=//\ %s

	au FileType python set tabstop=4 shiftwidth=4 expandtab ai

	au FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

	" markdown 允许自动换行
	au FileType markdown setlocal wrap

	" lisp 进行微调
	au FileType lisp setlocal ts=8 sts=2 sw=2 et

	" scala 微调
	au FileType scala setlocal sts=4 sw=4 noet

	" haskell 进行微调
	au FileType haskell setlocal et

	" quickfix 隐藏行号
    au FileType qf setlocal nonumber

	au BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
	au BufRead,BufNewFile *.part set filetype=html
	au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

	" disable showmatch when use > in php
	au BufWinEnter *.php set mps-=<:>

	" 强制对某些扩展名的 filetype 进行纠正
	au BufNewFile,BufRead *.as setlocal filetype=actionscript
	au BufNewFile,BufRead *.pro setlocal filetype=prolog
	au BufNewFile,BufRead *.es setlocal filetype=erlang
	au BufNewFile,BufRead *.asc setlocal filetype=asciidoc
	au BufNewFile,BufRead *.vl setlocal filetype=verilog

augroup END


" ====================Wild Ignore====================
" 文件搜索和补全时忽略下面扩展名

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib "stuff to ignore when tab completing
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz    " MacOSX/Linux
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
