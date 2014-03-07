set helplang=cn
set encoding=utf-8

set expandtab
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set number
set showmatch
set ruler
set ignorecase
set incsearch
set nu
colorscheme darkblack
syntax enable
syntax on

set nobackup
if has("vms")
    set nobackup
else
    "set backup
endif

"set tags=/home/liyi/php/tags
set tags=/home/users/liyi07/work/tags

let Tlist_Use_Right_Window=1 "use right window
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Show_Menu=1
let Tlist_Ctags_Cmd = '/home/users/liyi07/ctags/bin/ctags'
let Tlist_Auto_Open=1
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWindowLayout = "TagList|BufExplorer"
nmap <silent> <F8> :WMToggle<cr>
nnoremap <silent> <F3> :Grep<CR>
"map <c-w><c-f> :FirstExplorerWindow<cr>
"map <c-w><c-b> :BottomExplorerWindow<cr>
"map <c-w><c-t> :WMToggle<cr>

inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap " ""<ESC>i
"inoremap ' ''<ESC>i

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
map <F7> :NERDTreeToggle<CR>

function! s:SourceExistFile(filename)
	if filereadable(a:filename)
		exec 'source '. a:filename
	endif
endfun

"检测php语法
"map <F8> :!php -l <CR>
"更新当前目录的代码
map <F5> :!svn up <CR>
"提交当前目录的svn
map <F4> :!svn ci -m ""<CR>
"提交当前文件
map <F6> :!svn ci -m "" % <CR>

"conf for tabs
let mapleader = ','
nnoremap <C-l> gt
nnoremap <leader>t : tabe<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap ,1 1gt
nnoremap ,2 2gt
nnoremap ,3 3gt
nnoremap ,4 4gt
nnoremap ,5 5gt
nnoremap ,6 6gt
nnoremap ,7 7gt
nnoremap ,8 8gt
nnoremap ,9 9gt
nnoremap ,0 :tablast<CR>

"let g:vimrc_author='liyi'
"let g:vimrc_email='lyliyi2009@gmail.com'
"let g:vimrc_homepage='http://blog.maobo.net'
"nmap <F4> :AuthorInfoDetect<cr>
"
if has("cscope")
	set csprg=/home/users/liyi07/cscope/bin/cscope
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
		cs add ./cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
	set cscopetag
endif


"runtime! __Project__.vim
"call s:SourceExistFile($HOME.'/.vim/__Project__.vim')
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

