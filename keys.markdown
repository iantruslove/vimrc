# Key Bindings

## Displaying wrapped text
* `:set wrap linebreak textwidth=0 nolist` - sets up a non word-breaking wrap mode
* `:set showbreak=…` - show linebreaks as the ellipsis (that's `<C-v>u2026` to get the "…")

## Reformatting 

* `:gq`{motion} - linewraps the range of text
* `:gqgq` - linewraps curent line

## Motion

* tab - jump to next location in jump list
* C-o - jump to previous location in jump list

## Copy Paste

* C-o p - paste *whilst in insert mode*

## Search and Replace

* `&` - redo last replace
* `C-r "` - pastes the last yanked text in command mode (e.g. highlight some text, `y`, `/<C-r>"`)

## Word and Character Counts

* `g C-g` - count words and chars in document
* `{visual}g C-g` - count words in visual selection

## Spellcheck

* `:setlocal spell spelllang=en_us` to turn on spellchecker
* `]s` to go to the next spelling mistake
* `:h spell`

# Plugins

## Fugitive

* `:Gdiff` - enter merge mode for a conflicted file
* `:Gwrite` - mark the merge as complete, and add the file to the commit list

*Remember: `git rebase --continue` after a rebase merge to finish off the rebase*

## vim-rspec

<https://github.com/skwp/vim-rspec>

* :RunSpec to run specs in current file
* n - jump to source of next error

## Rdebugger

* `:Rdebugger script.rb`
* `:Rdebugger 'script.rb with arguments'`
* `:RdbLog` - shows log from current script
* `:RdbStop` - stops running the debugging server
* `<Leader>b` - toggle breakpoint
* <Leader>v - open variables window
* <Leader>m - open breakpoints window
* <Leader>t - open frames window
* <Leader>s - step
* <Leader>f - finish
* <Leader>n - next
* <Leader>c - continue
* <Leader>e - exit
* <Leader>d - remove all breakpoints

## vim-filesearch

* `:Fsgrep` - find files containing regex 
	* `:Fsgrep /TODO/ .` - find all files containing `TODO` in pwd
	* `:Fsgrep /TODO/js src` - find all Javascript files containing `TODO` in the `src/` directory
* `:Fsfind` - find files with name matching regex
* `:Fsglob` - find files with name matching glob

## Surround With

* `ysiw"` - surrounds the current word with double quotes
* `cs'"` - for the word under the cursor, change its surroundings from single quote to double quote
* {visual}`S"` - surrounds the visual selection with double quotes

## Clojure

http://writequit.org/blog/?p=386
* Start a screen session up on a terminal
  * `screen -S clojure` # this names the session "clojure"
  * List open screen sessions with `screen -ls`
* Start a REPL in the screen session
* `<C-c> <C-c>` - send function under cursor to the repl
* `<C-c> v` - set up the screen in slime.vim again

# Links

* [Visual guide to vim color schemes](http://vimcolorschemetest.googlecode.com/svn/html/index-java.html)
