""===========================
"" Plugin setting
""===========================
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

" git diff marks
" Plug 'airblade/vim-gitgutter'

" fugitive
Plug 'tpope/vim-fugitive'

" git diff marks
Plug 'mhinz/vim-signify'

" ALE
" Plug 'dense-analysis/ale'

call plug#end()
