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


runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags
