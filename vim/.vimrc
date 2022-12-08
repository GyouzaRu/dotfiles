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
set showmode        "显示当前输入模式
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
set tags=./tags,tags;       "自动设置tags

"" setting for ideavim
if has('ide')
    set surround
    set multiple-cursors
    set commentary
    set NERDTree
end


""===========================
"" color schemes
""===========================
colo ron
"murphy


""===========================
"" map
""===========================
let mapleader=" "
map s <nop>
inoremap jk <ESC>
map R :source $MYVIMRC<CR>

"" moving cursor
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

"" change join keybind
nnoremap <C-j> J

"" split window
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sc <C-w>q

"" move cursor to split window
map <C-l> <C-W>l
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
inoremap <C-l> <ESC><C-W>l
inoremap <C-h> <ESC><C-W>h
inoremap <C-j> <ESC><C-W>j
inoremap <C-k> <ESC><C-W>k

"" control window size
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"" control tab
map tb :tabe<cr>
nnoremap <c-n> :tabn<cr>
nnoremap <c-b> :tabp<cr>
inoremap <c-n> <esc>:tabn<cr>
inoremap <c-b> <esc>:tabp<cr>
"" use <c-p> instead of <c-b>
nnoremap <c-p> <c-b>
vnoremap <c-p> <c-b>

"" terminal
if has('ide')
    map <C-t> <Action>(ActivateTerminalToolWindow)
    imap <C-t> <Esc><Action>(ActivateTerminalToolWindow)
else
    nnoremap <C-t> :below term<cr>
    inoremap <C-t> <Esc>:below term<cr>
end

"" cancel search highlight
map <leader><CR> :nohlsearch<CR>

"" copy and paste with system
vnoremap <C-C> "+y


"" Nerdtree
nnoremap <leader>t :NERDTree<CR>

""===========================
"" Plugin setting
""===========================
call plug#begin()

"" NERDTree
Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'preservim/tagbar'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

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


