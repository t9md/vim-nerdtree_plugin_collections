" very experimental
if !exists('g:loaded_nerdtree_plugin_easymove')
    let g:loaded_nerdtree_plugin_easymove = 1
endif
if g:loaded_nerdtree_plugin_easymove == 1
    finish
endif
let g:loaded_nerdtree_easymove = 1

function! s:callback_for(name)
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . a:name
endfunction

function! s:chRoot()
    let currentDir = g:NERDTreeFileNode.GetSelected().path.getDir().str()
    let s:ref = function(FuncToolFuncNameFor("chRoot", 'initNerdTree$')[0])
    call call(s:ref, [])
    normal! j
endfunction

function! s:upDir()
    let s:ref = function(FuncToolFuncNameFor("upDir", 'initNerdTree$')[0])
    call call(s:ref, [0])
endfunction

call NERDTreeAddKeyMap({
      \ 'callback': s:callback_for('chRoot'),
      \ 'quickhelpText': 'chRoot',
      \ 'key': 'l',
      \ })

call NERDTreeAddKeyMap({
      \ 'callback': s:callback_for('upDir'),
      \ 'quickhelpText': 'upDir',
      \ 'key': 'h',
      \ })
