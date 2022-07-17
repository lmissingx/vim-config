" ==============================Indentation==============================
"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------
set tabstop=4    " tabstop: Number of spaces that a <Tab> in the file count for
set shiftwidth=4    " shiftwidth: 1 tab = 4 spaces
"set noet

" softtabstop: Number of spaces that a <Tab> counts for while
" performing editing operatoions. in fact mix of spaces and <Tab>s
set softtabstop=4

augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END
" ==============================Indentation==============================
