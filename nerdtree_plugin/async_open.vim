" File: async_open.vim
" Author: Eric Langlois <eric@langlois.xyz>
" Description: A plugin for NERDTree that opens files asynchronously
" Last Modified: August 29, 2020
" License: MIT
if exists('g:loaded_nerdtree_async_open')
    finish
endif
let g:loaded_nerdtree_async_open = 1

" Note: This is untested
function! NERDTreeExecuteFile()
    let l:node = g:NERDTreeFileNode.GetSelected()

    if empty(l:node)
        return
    endif

    call system('open ' . shellescape(l:node.path.str()) . ' &')
endfunction

function! NERDTreeExecuteFileLinux()
    let l:node = g:NERDTreeFileNode.GetSelected()

    if empty(l:node)
        return
    endif

    call system('xdg-open ' . shellescape(l:node.path.str()) . ' &')
endfunction

" Note: There is also NERDTreeExecuteFileWindows
" I don't know what the appropriate command for windows would be.
" It's possible that the existing command is already asynchronous.
