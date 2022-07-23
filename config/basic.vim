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

" Allow backspacing over everthing in insert mode
set backspace=indent,eol,start

set history=1000     " 保存1000条历史命令(keep 200 lines of command line history)
"set ruler       " 状态栏显示行列号(show the cursor position all the time)
set showcmd    " 状态栏显示正在输入的命令(display incomplete commandss)
set showmode    " 左下角显示当前模式(show current mode down the botton)
set wildmenu    " (display completion matches in a status line)
set relativenumber number    " 显示行号和相对行号(display line number and relative number)
"set gcr=a:blinkon0    " The cursor should look like in different modes.fully works in the GUI
set visualbell        " 关闭声音(No sounds)
set nowrap      " 不换行(Don't wrap lines)
"set autoread      " 外部修改后自动重新加载(Reload files changed outside vim)
"set clipboard=unnamed  " yank to the system register (*) by default

set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key

set display=lastline
set cursorline  " 突出显示当前行(When there is a previous search pattern)
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

set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m  " 错误格式

" set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set listchars=tab:>-,trail:-,eol:<,nbsp:%,extends:>,precedes:<    " 分隔符可视(display tabs and trailing spaces)

" 设置 tags：当前文件所在目录往上向根目录搜索直到碰到 .tags 文件
" 或者 Vim 当前目录包含 .tags 文件
set tags=./.tags;,.tags

" Specifies the key sequence that toggles the 'paste' option
" (sane indentation when 'paste' option) work in InsMode,Normode
set pastetoggle=<F11>


" ====================Security====================
set modelines=0
set nomodeline


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
