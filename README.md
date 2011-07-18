NERDtree plugin collections I use
==================================
## local_mapping.vim
help to define custom keymap in nerdtree buffer

to disable:

    let g:loaded_nerdtree_plugin_local_mapping = 1

## nerdtree_ctags.vim
generate tags for specified directory

to disable:

    let g:loaded_nerdtree_plugin_ctags = 1

## nerdtree_localrc.vim
thinca's localrc helper

* [thinca/vim-localrc](https://github.com/thinca/vim-localrc)
this plugin write .local.vimrc for specified directory

to disable:

    let g:loaded_nerdtree_plugin_localrc = 1

## nerdtree_open.vim
open target node with appropriate application command such as 'xdg-open' , 'gnome-open' , 'open'(for MacOS)  
This plugin use Shougo's vimproc if instaled.

* [Shougo/vimproc](https://github.com/Shougo/vimproc)

to disable:

    let g:loaded_nerdtree_plugin_open = 1

## nerdtree_unite.vim
miscellaneous helper for Shougo's unite.vim

* [Shougo/unite.vim](https://github.com/Shougo/unite.vim)

to disable:

    let g:loaded_nerdtree_plugin_unite = 1

## nerdtree_vimfiler.vim
open NerdTreeNode in Shougo's vimfiler

* [Shougo/vimfiler](https://github.com/Shougo/vimfiler)

to disable:

    let g:loaded_nerdtree_plugin_unite = 1

## nerdtree_easymove.vim

C: change tree root to the selected dir with `l`  
u: move tree root up a dir with `h`  

This is very very experimental and dirty hack.  
This plugin is disabled by default.  
So to enable this plugin  

first. install  

* [t9md/vim-misc-experiment](https://github.com/t9md/vim-misc-experiment)

then set:

    let g:loaded_nerdtree_plugin_unite = 0
