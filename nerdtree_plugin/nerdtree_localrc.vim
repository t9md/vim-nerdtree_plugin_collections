" Check: git://github.com/thinca/vim-localrc.git
if exists("g:loaded_nerdtree_plugin_localrc")
    finish
endif
let g:loaded_nerdtree_plugin_localrc = 1


function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    let currentDir = g:NERDTreeDirNode.GetSelected().path.str({'format': 'Cd'})
    let oldCWD = getcwd()
    try
      execute 'cd ' . currentDir
      call writefile([
            \ 'lcd <sfile>:h',
            \ '" set isk+=!,?',
            \ ],
            \ '.local.vimrc')
    catch
      execute 'cd ' . oldCWD
    endtry
endfunction

call NERDTreeAddMenuItem({
            \ 'text': '(l)ocal rc',
            \ 'shortcut': 'l',
            \ 'callback': s:callback_name()})
