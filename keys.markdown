# Key Bindings

## Reformatting 

* :gq{motion} - linewraps the range of text

## Motion

* tab - jump to next location in jump list
* C-o - jump to previous location in jump list

## Copy Paste

* C-o p - paste *whilst in insert mode*

## Search and Replace

* `&` - redo last replace

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

