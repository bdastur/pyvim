"""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=700

"This lets VI show the row and column at the bottom of the screen
set ruler
set cursorline
set wildmenu
set showcmd

set cmdheight=2

set hlsearch
set incsearch

set lazyredraw

syntax enable

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
set nu!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set pathogen.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function PathogenConfig()
    call pathogen#infect()
    call pathogen#helptags()
    filetype plugin indent on
    syntax on
endfunction

function NERDTreeConfig()
    "NERDTree plugin Configuration
    ""Map Function key F2 to open/close navigation window.
    map <F2> :NERDTreeToggle<CR>
    let g:NERDTreeChDirMode=2
    let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
    let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
endfunction

function TaglistConfig()
    "Taglist Pluggin confiuration
    let Tlist_Ctags_Cmd = "/Users/bdastur/CODE/CTAGS/ctags-5.8/ctags"
    map <F3> :TlistToggle<CR>
    let g:Tlist_Use_Right_Window = 1
    let g:Tlist_GainFocus_On_ToggleOpen = 1
    let g:Tlist_Enable_Fold_Column = 1
    let g:Tlist_Exit_OnlyWindow = 1
endfunction


call PathogenConfig()
call NERDTreeConfig()
call TaglistConfig()


"Toggle line numbers
map .nu :set nu<CR>
map .nu! :set nu!<CR>


" Viewport Controls
" ie moving between split panes
" ,l - for left pane
" ,r - for right pane
" ,<UP> - for Upper pane
" ,<Down> - for Down pane
map <silent>,<Left> <C-w>h
map <silent>,<Right> <C-w>l
map <silent>,<Up> <C-w>k
map <silent>,<Down> <C-w>j


"By default do not show line numbers.
set nu!

""""""""""""""""""""""""""""""""""""""""
" pylint, pep8, pyflakes configs.
""""""""""""""""""""""""""""""""""""""""
let g:pymode_lint_ignore = "E265,W391,E303"

