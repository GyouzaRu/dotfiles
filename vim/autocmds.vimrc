""==Comment==
autocmd FileType apache setlocal commentstring=#\ %s

" set vifmrc filetype as vim
augroup filetypedetect
   autocmd BufNewFile,BufRead vifmrc :set filetype=vim
augroup END
