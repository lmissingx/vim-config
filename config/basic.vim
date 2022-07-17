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
if &compatible
    set nocompatible
endif

" Allow backspacing over everthing in insert mode
set backspace=indent,eol,start

set history=1000     " keep 200 lines of command line history
set ruler       " show the cursor position all the time
set showcmd    " display incomplete commandss
set showmode    " show current mode down the botton
set wildmenu        " display completion matches in a status line
set number    " display line number

set gcr=a:blinkon0    " Disable cursor blink
set visualbell        " No sounds
set nowrap      "Don't wrap lines
set autoread      " Reload files changed outside vim
set clipboard=unnamed  " yank to the system register (*) by default

set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

set display=lastline
set cursorline  " When there is a previous search pattern
"set cursorcolumn

set showmatch  " When a bracket is inserted, briefly jump to the matching one.

"set lazyredraw        " 延迟绘制（提升性能）


" ====================syntaxOn====================
" Switch syntax highlighting on when the terminal has colors or
" when using the GUI.
if &t_Co > 2 || has("gui_running")
    syntax enable
    syntax on

    " highlighting strings inside C comments.
    " Revert with ":unlet c_comment_strings".
    let c_comment_strings=1
endif

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" ====================Encoding====================
" 内部工作编码
set encoding=utf-8

" 文件默认编码
set fileencoding=utf-8

" 打开文件时自动尝试下面顺序的编码
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m

" 合并两行中文时，不在中间加空格
set formatoptions+=B

" 文件换行符，默认使用 unix 换行符
set ffs=unix,dos,mac


" ====================Indent====================
set et        " Insert Mode,use spaces to insert a <Tab>
set sw=4    " 1 tab = 4 spaces
set ts=4        " Number of spaces that a <Tab> in the file count for
set tw=120    " Text width maxmum chars before wrapping

" softtabstop: Number of spaces that a <Tab> counts for while
" performing editing operatoions. in fact mix of spaces and <Tab>s
set sts=4

set cindent        " Get the amount of indent for line according the C rules.
set autoindent      " Copy indent from current line when starting a new line.


" ====================Search====================
set hlsearch
set ignorecase  " Ignoring case in a pattern
set incsearch
set smartcase


" ====================Folding====================
if has('folding')
    " 允许代码折叠
    set foldenable

    " 代码折叠默认使用缩进
    set fdm=indent

    " 默认打开所有缩进
    set foldlevel=99
endif


" ====================Security====================
set modelines=0
set nomodeline


" ====================Others====================
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m  " 错误格式

" 设置分隔符可视
" Display tabs and trailing spaces visually
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" Specifies the key sequence that toggles the 'paste' option
" (sane indentation when 'paste' option) work in InsMode,Normode
set pastetoggle=<F11>

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