""===========================
"" basic setting
""===========================
set nocompatible    "不兼容vi
filetype on  "设置不同文件缩进
set mouse=a         "启用鼠标
set encoding=utf-8  "设置编码
set noerrorbells    "去除错误响铃
set number          "显示行号
set relativenumber "显示相对行号
syntax on           "高亮语法
"set showmode        "显示当前输入模式
set showcmd         "命令行显示输入命令
set autochdir       "执行命令在当前目录
set term=screen-256color        "设施256色
set tabstop=4       "Tab显示为4个空格(仍是tab符号)
set shiftwidth=4    "Tab替换的空格数量为4个
set expandtab       "Tab自动替换成空格
set softtabstop=0   "输入一个Tab时变成对应的Tab和space组合
set backspace=indent,eol,start  "行首退格到上一行行尾
set cursorline      "高亮光标所在行
set wrap            "自动换行
set linebreak       "整词换行
set wrapmargin=2    "距离右边2列时换行
set scrolloff=5     "打开文件时光标在第5行
set laststatus=2    "底部永久显示状态栏2行
set ruler           "右下角显示当前光标位置
set showmatch       "显示配对的另一半括号
set hlsearch        "高亮搜索
set incsearch       "增量搜索
set ignorecase      "忽略大小写
set smartcase       "智能大小写(与ignorecase联用时,搜索test,显示test和Test,搜索Test只显示Test)
set autoread        "当文件外部被改变时,自动更新载入
set listchars=tab:»·,trail:·        "显示符号
set list                            "显示符号
set wildmode=longest,list,full
set wildmenu                        "命令行补全
set tags=./.tags;,.tags;       "自动设置tags
set timeout timeoutlen=1000     "按下后等待1000ms
set ttimeout ttimeoutlen=100     "keycode 按下后等待100ms

"" setting for ideavim
if has('ide')
    set surround
    set multiple-cursors
    set commentary
    set NERDTree
end

"" change path of vim setting files
set viminfo+=n~/.dotfiles/vim/.viminfo
set runtimepath+=~/.dotfiles/vim
set packpath+=~/.dotfiles/vim

"" cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""===========================
"" color schemes
""===========================
colo ron
"colo murphy


""===========================
"" map
""===========================
let mapleader=" "
inoremap jk <ESC>

"" moving cursor
nnoremap J 5j
nnoremap K 5k
nnoremap H ^
nnoremap L $
vnoremap J 5j
vnoremap K 5k
vnoremap H ^
vnoremap L $
onoremap H ^
onoremap L $

"" change join keybind
nnoremap <C-j> J

"" split window
map <leader>sv :set splitright<CR>:vsplit<CR>
map <leader>sh :set splitbelow<CR>:split<CR>
map <leader>sc <C-w>q

"" move cursor to split window
if has("ide")
noremap <A-l> <C-W>l
noremap <A-h> <C-W>h
noremap <A-j> <C-W>j
noremap <A-k> <C-W>k
inoremap <A-l> <ESC><C-W>l
inoremap <A-h> <ESC><C-W>h
inoremap <A-j> <ESC><C-W>j
inoremap <A-k> <ESC><C-W>k
else
noremap <ESC>l <C-W>l
noremap <ESC>h <C-W>h
noremap <ESC>j <C-W>j
noremap <ESC>k <C-W>k
inoremap <ESC>l <ESC><C-W>l
inoremap <ESC>h <ESC><C-W>h
inoremap <ESC>j <ESC><C-W>j
inoremap <ESC>k <ESC><C-W>k
endif

"" control window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"" control buffer
nnoremap [b :bprevious<CR>
nnoremap ]b :bnext<CR>
nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>

"" control tab
map tb :tabe<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

"" terminal
if has('ide')
    map <A-t> <Action>(ActivateTerminalToolWindow)
    inoremap <A-t> <ESC><Action>(ActivateTerminalToolWindow)
else
    nnoremap <ESC>t :below term<CR>
    inoremap <ESC>t <ESC>:below term<CR>
    tnoremap <C-\><C-\> <C-\><C-n>
end

"" cancel search highlight
map <leader><CR> :nohlsearch<CR>

"" copy and paste with system
vnoremap <C-C> "+y

"" open lazygit
nnoremap <leader>lg :!lazygit<CR>


""===========================
"" Plugin setting
""===========================
call plug#begin()
call plug#begin('~/.dotfiles/vim/.vim/plugged')

"" NERDTree: file explore
Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tagbar
Plug 'preservim/tagbar'

" comment plugin
Plug 'tpope/vim-commentary'

" surround
Plug 'tpope/vim-surround'

" auto pairs
Plug 'jiangmiao/auto-pairs'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


""==Nerdtree==

nnoremap <leader>n :NERDTree<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

"" Nerdtree git plugin config
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

""==Comment==
autocmd FileType apache setlocal commentstring=#\ %s

""==Airline==
"" https://github.com/vim-airline/vim-airline
let g:airline#extensions#tabline#formatter = 'unique_tail'

""==Airline Theme==
""https://github.com/vim-airline/vim-airline-themes#vim-airline-themes--
let g:airline_theme='simple'
