if exists("g:loaded_nerdtree_plugin_vimfiler")
    finish
endif
let g:loaded_nerdtree_plugin_vimfiler = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    if !exists(':VimFiler')
        return
    endif
    let currentDir = g:NERDTreeFileNode.GetSelected().path.getDir().str({'format': 'Cd'})
    let cmd = "VimFiler " . currentDir
    silent wincmd p
    exe cmd
endfunction

call NERDTreeAddKeyMap({
      \ 'callback': s:callback_name(),
      \ 'quickhelpText': 'open node with VimFiler',
      \ 'key': 'V',
      \ })
