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
set updatetime=200

"" change path of vim setting files
set viminfo+=n~/.config/dotfiles/vim/.viminfo
set runtimepath+=~/.config/dotfiles/vim
set packpath+=~/.config/dotfiles/vim

"" cursor shape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""===========================
"" color schemes
""===========================
" colo desert
colo ron
" colo murphy


""===========================
"" map
""===========================
let mapleader=" "
" map s <nop>
inoremap jk <ESC>

" reload vimrc config
nnoremap <leader>R :w<CR>:source %<CR>

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
nnoremap <leader>j J

"" split window
map <leader>= <C-w>s
map <leader>- <C-w>v
" map sc <C-w>c

"" move cursor to split window
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
inoremap <C-l> <ESC><C-w>l
inoremap <C-h> <ESC><C-w>h
inoremap <C-j> <ESC><C-w>j
inoremap <C-k> <ESC><C-w>k

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
nnoremap tb :tabe<CR>
nnoremap tc :tabc<CR>
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>

"" cancel search highlight
map <leader><CR> :nohlsearch<CR>

"" copy and paste with system
vnoremap <C-C> "+y

"" open lazygit
nnoremap <leader>lg :!lazygit<CR>


""===========================
"" IDE setting
""===========================
if has('ide')
"" setting for ideavim
    set surround
    set multiple-cursors
    set commentary
    set NERDTree

    " Hide open panels
    nmap <Leader>w :action HideAllWindows<CR>
    " nnoremap <Tab> :bnext<CR>
    " nnoremap <S-Tab> :bprevious<CR>

"" terminal
    map <C-q> <Action>(ActivateTerminalToolWindow)
    inoremap <C-q> <ESC><Action>(ActivateTerminalToolWindow)
    tnoremap <C-q> <Action>(ActivateTerminalToolWindow)

    " nmap <Leader>be :action Switcher<CR>
    nnoremap <leader>p :action RecentProjectListGroup<CR>
    nnoremap <leader>b :action RecentFiles<CR>
    nnoremap <leader>f :action GotoFile<CR>
    nnoremap <leader>g :action SearchEverywhere<CR>

    " diag
    nnoremap gd :action GotoDeclaration
    nnoremap gd :action GotoDeclaration
    nnoremap ]d <Action>(GotoNextError)
    nnoremap [d <Action>(GotoPreviousError)
end

""===========================
"" Plugin setting
""===========================
source ~/.config/dotfiles/vim/plugins.vimrc

""==Nerdtree==
nnoremap <leader>n :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

"" Nerdtree git plugin config
let NERDTreeMapActivateNode = 'l'
let NERDTreeCloseDir = 'h'

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

""==Airline==
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

""==Airline Theme==
let g:airline_theme='simple'

""==TagBar==
nnoremap <leader>t :TagbarToggle<CR>

""==signify==
nnoremap <leader>g :SignifyToggle<CR>
highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE

""===========================
"" Autocmds
""===========================
source ~/.config/dotfiles/vim/autocmds.vimrc
