runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax on
filetype plugin indent on

"sounds
set noerrorbells
set novisualbell
set vb t_vb=

set helplang=cn
set encoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,gbk,euc-jp,latin1
set fileencoding=utf-8
set termencoding=utf-8 "编码转换


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
set smarttab
set tabpagemax=20
set showtabline=2
set nowrapscan
"set relativenumber
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set backspace=2

set number
set showmatch
set matchtime=1
set ruler

set autochdir 
set ignorecase
set incsearch
set hlsearch
set nu
colorscheme torte
syntax enable

set guioptions-=T " 隐藏工具栏
set guioptions-=m " 隐藏菜单栏
set cmdheight=1 " 设定命令行的行数为 1
set laststatus=2 " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

set nocompatible
set nobackup

set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

nmap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30

set tags=./tags

"let Tlist_Use_Right_Window=1 
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Show_Menu=1
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let Tlist_Auto_Open=0
"let g:winManagerWindowLayout = "TagList|FileExplorer,BufExplorer"

map <F2> :TlistToggle<cr>
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Compact_Format = 1           " 使用小窗口.
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Enable_Fold_Column = 0       " 使taglist插件不显示左边的折叠行
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Inc_Winwidth = 0             " 防止taglist改变终端窗口的大小
let Tlist_WinWidth = 25                " taglist窗口宽度
let Tlist_Sort_Type = 'name'           " 排序 name.


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

let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

map <F10> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'php'
        exec "!php %"
    endif
endfunc

map <F7> :make<CR>

"conf for tabs
nnoremap <leader>t : tabe<CR>
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
	set csprg=/usr/loca/bin/cscope
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

"NERDTree
let loaded_netrwPlugin = 0
let NERDTreeCaseSensitiveSort=1
let NERDTreeHijackNetrw = 0
let NERDTreeChDirMode = 2
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 25
let NERDTreeIgnore = [ '^\.svn$', '\~$', '.o$', '.so$','.a$' ]
let g:nerdtree_tabs_open_on_console_startup=1

"-----------------------------------------------------------------
" plugin - NERD_commenter.vim 注释代码用的
" 将 mapleader 设置为 `,`
" [count],cc 光标以下count行逐行添加注释(7,cc)
" [count],cu 光标以下count行逐行取消注释(7,cu)
" [count],cm 光标以下count行尝试添加块注释(7,cm)
" ,cA 在行尾插入 /* */,并且进入插入模式。 这个命令方便写注释
" ,c<space> toggle 注释
" 注：count参数可选，无则默认为选中行或当前行
"-----------------------------------------------------------------
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" ---------------------------------------------------------------------
" plugin indent guides 对齐线
" ---------------------------------------------------------------------
" <Leader>ig     toggle


" **** Python *** {{{
" For lines that end with \n\ or \ and continue on the next one.
let g:pyindent_continue = 0
autocmd Filetype python set completefunc=pythoncomplete#Complete
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height=3
" }}}

"PowerLine插件 状态栏增强显示
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>

nmap <C-t>   :tabnew<cr>
nmap <C-p>   :tabprevious<cr>
nmap <C-n>   :tabnext<cr>
nmap <C-k>   :tabclose<cr>
nmap <C-Tab> :tabnext<cr>

"切换buffer
nmap bn :bn<cr>
nmap bp :bp<cr>

nmap <S-s> :!screen -x ipython_vim -X stuff $'ipython3 --matplotlib\n'<CR><CR>

function! SendLine()
    let curline = escape(getline('.'),'"')
    call system("screen -x ipython_vim -X stuff \"" . curline . "\n\"")
endfunction
nnoremap " :wa<CR>:!screen -x ipython_vim -X stuff $'\%run "%:p"\n'<CR><CR>
nnoremap <S-d> :wa<CR>:!screen -x ipython_vim -X stuff $'\%cd "%:p:h"\n'<CR><CR>
nnoremap ' :wa<CR>:call SendLine()<CR><CR>
