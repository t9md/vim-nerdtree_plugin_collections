" Init: {{{1
if exists("g:loaded_nerdtree_plugin_unite")
    finish
endif
let g:loaded_nerdtree_plugin_unite = 1
if !exists(':Unite')
    echoerr 'This plugin requires unite.vim'
    finish
endif

function! s:func_name_for(name)
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . a:name
endfunction

" MainFunction: {{{1
function! s:unite(cmd_str)
    let currentDir = g:NERDTreeFileNode.GetSelected().path.getDir().str({'format': 'Cd'})
    let cmd = printf(a:cmd_str, currentDir)
    silent wincmd p
    exe cmd
endfunction
function! s:file_rec()
    call s:unite('Unite -input=%s/ file_rec -buffer-name=files')
endfunction
function! s:grep()
    call s:unite('Unite grep:%s/**')
endfunction
function! s:ack()
    call s:unite('Unite ack:%s')
endfunction

" UserInterface: {{{1
let submenu = NERDTreeAddSubmenu({
            \ 'text': '(u)nite',
            \ 'shortcut': 'u', })

call NERDTreeAddMenuItem({
            \ 'parent': submenu,
            \ 'text': 'file_(r)ec',
            \ 'shortcut': 'r',
            \ 'callback': s:func_name_for("file_rec"),
            \ })
call NERDTreeAddMenuItem({
            \ 'parent': submenu,
            \ 'text': '(g)rep',
            \ 'shortcut': 'g',
            \ 'callback': s:func_name_for("grep"),
            \ })
call NERDTreeAddMenuItem({
            \ 'parent': submenu,
            \ 'text': '(a)ck',
            \ 'shortcut': 'a',
            \ 'callback': s:func_name_for("ack"),
            \ })
" vim: set sw=4 sts=4 et fdm=marker:
