let g:pathogen_disabled = ["vim-ruby-debugger"]   " To disable a plugin, add its bundle name to this list

" for some reason the csscolor plugin is very slow when run on the terminal but not in GVim, so disable it if no GUI is running
"if !has('gui_running')
"    call add(g:pathogen_disabled, 'csscolor')
"endif

" Gundo requires at least vim 7.3
"if v:version < '703' || !has('python')
"    call add(g:pathogen_disabled, 'gundo')
"endif

"if v:version < '702'
"    call add(g:pathogen_disabled, 'autocomplpop')
"    call add(g:pathogen_disabled, 'fuzzyfinder')
"    call add(g:pathogen_disabled, 'l9')
"endif

" Configure sparkup bindings
let g:sparkupExecuteMapping = '<c-e>'
let g:sparkupNextMapping = '<c-e>'

call pathogen#infect()
call pathogen#helptags()

" Remap buffergator bindings
let g:buffergator_suppress_keymaps = 1  " disable default keybindings
let g:buffergator_autodismiss_on_select = 0 "stop buffergator from autoclosing
nmap ,bb :BuffergatorToggle<CR>
nmap ,bt :BuffergatorTabsToggle<CR>

syntax on
filetype plugin indent on

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR> 	" edit
nmap <silent> <leader>sv :so $MYVIMRC<CR> " source
nmap <silent> <leader>ek :e ~/.vim/keys.markdown<CR>zR<CR>

" (D is the Command key)
map <D-[> :bprevious<CR> 	" Cycle to previous buffer
map <D-]> :bnext<CR> 		" Cycle to next buffer

" Shortcuts for navigating around windows
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

nmap ,nn :NERDTreeToggle<CR>
nmap ,no :NERDTree<CR>
nmap ,nq :NERDTreeClose<CR>

" Vim movement keys onlu
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" slime - https://github.com/jpalardy/vim-slime
" Configure slime for tmux
let g:slime_target = "tmux"

" Run a slime screen command for this line only  (as opposed to this paragraph)
nmap <C-c><C-l> 0v$<C-c><C-c>

set nocompatible

set ruler 			" Show line and col number

set hidden        " Hide buffers, don't close

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
set tabstop=2
set shiftwidth=2
set expandtab
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

" Show trailing spaces
set list
set listchars=""
set listchars=tab:__
set listchars+=trail:.

" Disable toolbar in MacVim
if has("gui_running")
  set guioptions=egmrt
  set guifont=Inconsolata:h12
endif

""" Purdy colors please
"colorscheme bensday
"colorscheme af
"colorscheme gentooish
colorscheme anotherdark
"colorscheme blacklight

"""  Key mappings """

function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <M-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <M-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <M-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <M-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <M-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <M-Down> :<C-u>call MoveVisualDown()<CR>


""" Plugin Config """

" Settings for VimClojure
let g:vimclojure#HighlightBuiltins = 1  " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow = 1       " Rainbow parentheses

" Turn off ShowMarks on startup
let g:showmarks_enable = 0

" Configure snipmate plugin
let g:snips_trigger_key='<c-space>'

" Configure CtrlP plugin
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode = 0 " just use vim's PWD as the root of the ctrlp search

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


""" Autocommands """

" autocmd!     " reset all pre-existing autocmds
"autocmd VimEnter * NERDTree    " Open NERDTree on startup
""""""""""""""""""
" Configure coffeescript to be standard 2-space indents
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

