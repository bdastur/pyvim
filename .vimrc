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
" Install vim plug if not already.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install pathogen plugin if not already.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/pathogen.vim'))
  silent !curl -LSso ~/.vim/autoload/pathogen.vim --create-dirs https://tpo.pe/pathogen.vim
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim plugins using plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

"File Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Cool status bar.
Plug 'vim-airline/vim-airline'

"Snippets management
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"Python autocomplete
Plug 'davidhalter/jedi-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install plugins using pathogen.
""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set pathogen.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function PathogenConfig()
    call pathogen#infect()
    call pathogen#helptags()
    filetype plugin indent on
    syntax on
endfunction

call PathogenConfig()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable nerdtree 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function NERDTreeConfig()
    "NERDTree plugin Configuration
    " Map ,n to open/close navigation window. <silent>,<Left> <C-w>h
    map ,n :NERDTreeToggle<CR>
    let g:NERDTreeChDirMode=2
    let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
    let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
endfunction

call NERDTreeConfig()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable ctrlp.vim 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
function CtrlpConfig()
    " ctrlp plugin configuration.
    " Run at Vim's command line :helptags ~/.vim/bundle/ctrlp.vim/doc
    set runtimepath^=~/.vim/bundle/ctrlp.vim
endfunction

call CtrlpConfig()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable LanguageClient
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
func LanguageClientConfig()
    set runtimepath+=~/.vim-plugins/LanguageClient-neovim
    let g:LanguageClient_serverCommands = {
    \ 'python': ['/Users/behzad.dastur/pyenv/py3env/bin/pyls'],
    \ }
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_autoStop = 1
    let g:LanguageClient_changeThrottle = 0.5
endfunction

call LanguageClientConfig()



"""""""""""""""""""""""""""""""""""
" maps
"""""""""""""""""""""""""""""""""""
:let mapleader = ","
" Toggle line numbers
map <leader>nu :set nu<CR>
map <leader>nu! :set nu!<CR>

" Viewport Controls
" " ie moving between split panes
" ,l - for left pane
" ,r - for right pane
" ,<UP> - for Upper pane
" ,<Down> - for Down pane
map <silent>,<Left> <C-w>h
map <silent>,<Right> <C-w>l
map <silent>,<Up> <C-w>k
map <silent>,<Down> <C-w>j

"Cleanup whitespaces
map <leader>ws! :%s/\s\+$//e

"By default do not show line numbers.
set nu!

"Matchit. https://www.vim.org/scripts/script.php?script_id=39
"python_match.vim: https://www.vim.org/scripts/script.php?script_id=386
" Manual install:
" mkdir -p ~/.vim/plugin
" cp matchit.vim ~/.vim/plugin/.; cp python_match.vim ~/.vim/plugin/.
source ~/.vim/plugin/matchit.vim
source ~/.vim/plugin/python_match.vim
:let loaded_matchit = 1

au BufNewFile postmortem-*.md 0r ~/postmortem-templates/templates/postmortem-template-srebook.md
