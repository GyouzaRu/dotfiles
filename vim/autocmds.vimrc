""==Comment==
autocmd FileType apache setlocal commentstring=#\ %s

" set vifmrc filetype as vim
augroup filetypedetect
   autocmd BufNewFile,BufRead vifmrc :set filetype=vim
augroup END

" set cursorline in active window
autocmd WinEnter * :set cursorline
autocmd WinLeave * :set nocursorline

" auto delete space at the end of the line
autocmd BufWritePre * :%s/\s\+$//e

" format c/cpp code
autocmd BufNewFile,BufRead *.c,*.cpp,*.cc,*.h,*.hpp :setlocal equalprg=clang-format

" different autoindent
autocmd BufNewFile,BufRead *.lua,.gitconfig :setlocal tabstop=2 shiftwidth=2 softtabstop=2
