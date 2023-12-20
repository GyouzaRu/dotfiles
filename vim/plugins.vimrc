""===========================
"" Plugin setting
""===========================
call plug#begin('~/.vim/plugins')

"" NERDTree: file explore
Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" theme gruvbox
Plug 'morhetz/gruvbox'

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

" git diff marks
" Plug 'airblade/vim-gitgutter'

" fugitive
" Plug 'tpope/vim-fugitive'

" git diff marks
Plug 'mhinz/vim-signify'

" ALE
" Plug 'dense-analysis/ale'

" navi between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" fzf support
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'

call plug#end()
