set helplang=cn
set encoding=utf-8

set smartindent
set shiftwidth=4
set tabstop=4
set number
set showmatch
set ruler
set ignorecase
set incsearch
set nu
set background=dark
syntax enable
syntax on

if has("vms")
    "set nobackup
else
    "set backup
endif

"set tags=/home/liyi/python/tags

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let Tlist_Auto_Open=1
let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
nmap <silent> <F8> :WMToggle<cr>
nnoremap <silent> <F3> :Grep<CR>
"map <c-w><c-f> :FirstExplorerWindow<cr>
"map <c-w><c-b> :BottomExplorerWindow<cr>
"map <c-w><c-t> :WMToggle<cr>

inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" PHP 自动完成
" 设置自动完成的监听方式：尾部添加一个字母和清除一个字母
set complete-=k complete+=k

" 设置字典补全文件
set dictionary=$HOME/.vim/dict/php.dict
" 使用 tab 键自动完成或尝试自动完成
function! InsertTabWrapper()
	let col=col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<TAB>"
	else
		return "\<C-N>"
	endif
endfunction
										
" 重新映射 tab 键到 InsertTabWrapper 函数
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

"NERDTree
map <F8> :NERDTreeToggle<CR>

function! s:SourceExistFile(filename)
	if filereadable(a:filename)
		exec 'source '. a:filename
	endif
endfun

let g:vimrc_author='liyi'
let g:vimrc_email='lyliyi2009@gmail.com'
let g:vimrc_homepage='http://blog.maobo.net'
nmap <F4> :AuthorInfoDetect<cr>

"runtime! __Project__.vim
"call s:SourceExistFile($HOME.'/.vim/__Project__.vim')
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags
