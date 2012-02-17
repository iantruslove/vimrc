call pathogen#infect()
call pathogen#helptags()

set nocompatible

" Line numbers
set number

" Highlight the search term
set hlsearch

" Set up line highlighing
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" toggle between horizontal and vertical column highlight
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Only do highlighting in the current window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

syntax on
filetype plugin indent on

" Always show the tab header
set showtabline=2

" Default tab settings
set tabstop=3
set shiftwidth=3
set noexpandtab


