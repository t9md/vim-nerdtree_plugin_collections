if exists("g:loaded_nerdtree_plugin_vimshell")
    finish
endif
let g:loaded_nerdtree_plugin_vimshell = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    if !exists(':VimShell')
        return
    endif
    let currentDir = g:NERDTreeFileNode.GetSelected().path.getDir().str({'format': 'Cd'})
    let cmd = "VimShell " . currentDir
    silent wincmd p
    exe cmd
endfunction

call NERDTreeAddKeyMap({
      \ 'callback': s:callback_name(),
      \ 'quickhelpText': 'open node with vimshell',
      \ 'key': 'S',
      \ })
