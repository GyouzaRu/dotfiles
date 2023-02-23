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
