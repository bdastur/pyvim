#!/bin/bash
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

"This lets VI show the row and column at the bottom of the screen
set ruler

set cmdheight=2

set hlsearch
set incsearch

set lazyredraw

syntax enable

"By default do not show line numbers.
set nu!


""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dealing with tabs.
""""""""""""""""""""""""""""""""""""""""""""""""""""
"Expand tabs to spaces.
set expandtab
""""""""""""""""""""""set smarttab

"Set tab to 4 spaces.
set shiftwidth=4
set tabstop=4

"""set ai "Auto indent
"""set si "Smart indent
set wrap "Wrap lines

set showmatch
set mat=2

""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pathogen
""""""""""""""""""""""""""""""""""""""""""""""""""""
"execute pathogen#infect()
"syntax on
"filetype plugin indent on
"
"
filetype on

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""
" NOTE: In all the mappings ',' is the leader
"""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/bundle/cscope_maps.vim
map ,c <C-\>s

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings.
""""""""""""""""""""""""""""""""""""""""""""""""""""

"pymode plugin Configuration
let g:pymode_trim_whitespaces = 1


"NERDTree plugin Configuration
map <F2> :NERDTreeToggle<CR> 
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1

"Taglist Pluggin confiuration
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Exit_OnlyWindow = 1

"let Tlist_Close_On_Select = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_Use_SingleClick = 1




"Toggle line numbers
map .nu :set nu<CR>
map .nu! :set nu!<CR>

" Viewport Controls
" " ie moving between split panes
" ,l - for left pane
" ,r - for right pane
map <silent>,l <C-w>h
map <silent>,r <C-w>l

"By default do not show line numbers.
set nu!

