" RekulSaveThenPHPFormat()
" 
" Save file before running CSFixer so we don't lose changes
"
" Run RekulSaveThenPHPFormat() writing the file before calling php-cs-fixer
" Buffers that aren't first saved, then run, will wipe out any changes made, kinda annoying so this fixes that
" It also executes a double carriage return so you don't have to hit enter twice
autocmd FileType php nnoremap <silent><leader>pf :call RekulSaveThenPHPFormat()<cr><cr>
function! RekulSaveThenPHPFormat()
    write
    call PhpCsFixerFixFile()
    return
endfunction
