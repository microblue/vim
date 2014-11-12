"sounds
set noerrorbells
set novisualbell
set vb t_vb=

set helplang=cn
set encoding=utf-8

set autoindent
set autoread
set backupcopy=yes
set clipboard=unnamed
set directory-=.
set laststatus=2

set showcmd
set smartcase
set scrolloff=3

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

set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

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
let Tlist_Auto_Open=0
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"
let g:winManagerWindowLayout = "TagList|BufExplorer"

"keyborad shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

"nmap <silent> <F8> :WMToggle<cr>
"nnoremap <silent> <F3> :Grep<CR>
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

function! s:SourceExistFile(filename)
	if filereadable(a:filename)
		exec 'source '. a:filename
	endif
endfun

"检查php语法
map <F9> :!php -l % <CR>

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

"authorinfo
let g:vimrc_author='liyi'
let g:vimrc_email='liyi@e.hunantv.com'
let g:vimrc_homepage='http://www.hunantv.com'
nmap <F4> :AuthorInfoDetect<cr>

"php 注释
"source $HOME/.vim/bundle/php-doc/php-doc.vim
inoremap <F3> <ESC>:call PhpDocSingle()<CR>
nnoremap <F3> :call PhpDocSingle()<CR>
vnoremap <F3> :call PhpDocRange()<CR>

autocmd FileType php map <F1> :!php %<CR>
autocmd FileType python map <F1> :!python %<CR>
nmap <F9> :!php -l % <CR>


"PowerLine插件 状态栏增强显示
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y



runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
