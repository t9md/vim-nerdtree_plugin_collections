if exists("g:loaded_nerdtree_plugin_ctags")
    finish
endif
let g:loaded_nerdtree_plugin_ctags = 1

if !executable('ctags')
    echoerr 'This plugin requires ctags'
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
      silent execute '!ctags -R .'
      if v:shell_error
        echoerr v:shell_error
      endif
    catch
      execute 'cd ' . oldCWD
    endtry
endfunction

call NERDTreeAddMenuItem({
            \ 'text': '(t)ag generat',
            \ 'shortcut': 't',
            \ 'callback': s:callback_name()})
