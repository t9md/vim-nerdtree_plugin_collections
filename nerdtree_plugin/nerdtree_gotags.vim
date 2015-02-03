if exists("g:loaded_nerdtree_plugin_gotags")
    finish
endif
let g:loaded_nerdtree_plugin_gotags = 1

if !executable('gotags')
    echoerr 'This plugin requires gotags'
    finish
endif

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    let currentDir = g:NERDTreeDirNode.GetSelected().path.str({'format': 'Cd'})
    let oldCWD = getcwd()
    try
      execute 'cd ' . currentDir
      silent execute '!gotags -R -f tags .'
      if v:shell_error
        echoerr v:shell_error
      endif
    catch
      execute 'cd ' . oldCWD
    endtry
endfunction

call NERDTreeAddMenuItem({
            \ 'text': '(g)otag generat',
            \ 'shortcut': 'g',
            \ 'callback': s:callback_name()})
