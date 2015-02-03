if exists("g:loaded_nerdtree_plugin_getpath")
    finish
endif
" let g:loaded_nerdtree_plugin_getpath = 1


function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
  let path = g:NERDTreeFileNode.GetSelected().path.str()
  call setreg('*',path)
endfunction

call NERDTreeAddMenuItem({
            \ 'text': '(p)ath clipt file PATH',
            \ 'shortcut': 'p',
            \ 'callback': s:callback_name()})

