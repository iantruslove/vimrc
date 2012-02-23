call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR> 	" edit
nmap <silent> <leader>sv :so $MYVIMRC<CR> " source

" (D is the Command key)
map <D-[> :bprevious<CR> 	" Cycle to previous buffer
map <D-]> :bnext<CR> 		" Cycle to next buffer

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

set nocompatible

set ruler 			" Show line and col number

"set hidden        " Hide buffers, don't close

set hlsearch      " Highlight the search term
set incsearch     " show search matches as you type

set nowrap        " don't wrap lines
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise

set showtabline=2 " Always show the tab header

" Tab settings
set tabstop=3
set shiftwidth=3
set noexpandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" No old-skool backups or swp files
set nobackup
set noswapfile

" Configure CtrlP plugin
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Configure vim-ruby-debugger plugin
let g:ruby_debugger_progname = 'mvim'

""""""""""""""""""
" automcmd statements!

" reset all pre-existing autocmds
" autocmd!
autocmd VimEnter * NERDTree    " Open NERDTree on startup
""""""""""""""""""

" :Shell command: runs a shell command and dumps output to a scratch buffer.
" See http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

