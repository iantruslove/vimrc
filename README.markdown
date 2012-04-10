## Installation
Here's the basics for my vim config:

Clone the git repository into a new folder in your home directory
    git clone git://github.com/iantruslove/vimrc.git .vim
    cd .vim
    git checkout nsidc
    git submodule update --init
This should clone the git repo into ~/.vim/, and pull down all the
submodules too.

Now, create a symlink to the .vimrc file:
    cd ~
    ln -s ~/.vim/.vimrc

Now run vim and you should see, well, nothing new. :)


## Interesting Plugins

The interesting things are either in the .vimrc, or they are modules.

Starting with the latter, all the modules are managed with a module called
pathogen.  If you want to add your own modules, google that and you'll see
tons of results.  Other interesting modules (most of these have help, so
in Vim type in `:help <modulename>`, tab completion helps you out, and
you'll see useful things.  If not, you can find out the github url by
looking at .vim/.gitmodules, or just google for "git vim <modulename>".  I
try to get modules from vimscripts' github repo - they seem the most
stable and updated by the community):

* NERDTree - the file explorer pane.  `,nn` toggles the pane, and `?` when in
  the NERDTree shows quick keybinding help.
* CtrlP - an incremental search through the files in
  pwd.  If you want to open up a new file, `<C>-p` and start typing, move
  around the fuzzy search results, and enter to open the file.  Easy.  Also
  has modes to search through recently opened files, and currently open
  buffers
* colorschemes - loads of them.  `colorscheme <theme name>` to load one up.
* sparkup - really cool html expansions from CSS selector-ish syntax.
  Just check out their video at http://net.tutsplus.com/tutorials/other/vim-essential-plugin-sparkup/
* jshint - does jshint highlighting for JS files.  Should just work.
  Recognises settings in ~/.jshintrc
* snipname and snipmate-snippets - steals the best feature from TextMate.
  `<ctrl>+<space>` to trigger template replacement.  `:SnipMateOpenSnippetFiles`
  shows a list of snippet files that are valid for the current filetype,
  hitting enter shows all the snippets in that file.
* VCSCommand - a SVN client.  Not great, but functional.  NERDTree doesn't
  play nicely with it, so you can't easily show changes recursively in a
  directory. (I have a workaround though)
* fugitive - git client.  Where VCSCommand falls down, fugitive is
  awesome.  Only works with git though. 
* taglist - shows tags in the current file - I haven't used this
  extensively yet, but it's on my list of power tools to learn.
* Slime - used in combination with a gnu screen or tmux session, you can
  execute code in a window in an external repl, e.g. Ruby irb, JavaScript
  node, Clojure repl etc.

On to the .vimrc, there are mainly keybindings to module functions.  I use
windows and buffers quite a bit, so there are some idiomatic shortcuts for
moving around those effectively.  Everything in the .vimrc is searchable
in the vim help, so just dig into anything that is interesting and not
well commented.

Some vim things that really help me out (and remember, `<C>` means `<Ctrl>`):

* `:cd <somedir>` - changes pwd.  Tab completion on filenames.
* `:Shell <command>` - runs a shell command and keeps the output around in a scratch buffer
* `<C>-w <C>-f` - opens the filename under the cursor up in a new split window
* `\cv` - bound to the VCSCommand VimDiff view - i.e. Shows changes between the working copy and the last checked out version.
* `*` - search for the next instance of the word under the cursor.  Also happens to highlight every instance of that word.
* `<C>-o <command>` - temporarily drops out of insert mode to run a single command, e.g. `<C>-o p` pastes the last yank and keeps you in insert mode 
* All the window commands - very useful.  `<C>-w v` opens up a new vsplit. `<C>-w s` opens up a new hsplit.  `<C>-w q` closes the current window.  `<C>-w _` maximizes the window vertically.  `<C-w> =` makes the windows the same size.  There are so many window commands, hit `:help window`.

Pulling a couple of these together, to review changes you're about to
check in, I do the following:
`:Shell svn st | egrep "^M"`
This shows me changed files (beware - new files won't show up unless you
remove the egrep!)
Navigate around that window, and `<C>-w f` to open the modified files, and
`\cv` to open up the diff view. `<C>-w _` to make the window big,` ]c` and `[c`
navigate around differences.
Open up another file with `<C>-w f`, repeat `\cv` and the diff view will
switch over to the new file.

If you want to learn vim stuff, a great place for some easy tips is
http://vimcasts.org/ - there's a load of short, easy-to-digest videos.
Great place to start.

If I've updated and you want to get the latest changes, do
    git pull
    git submodule update --init

You may have noticed a `git checkout nsidc` at the top - I have some
customizations (e.g. Disabling the arrow keys) that I wouldn't push to
anyone else.  I've removed a couple of these personal settings from the
nsidc branch so you all can not get too messed up by my messing around.

Once you learn vim commands well, you can set your bash to use vim
keystrokes to move around and edit commands - `set -o vi` in your .bashrc
sets it up for you.

If you need a hand, just shout.  Happy to help.  Finally, I definitely
recommend MacVim.  It's totally fine running vim in terminal windows, but
sometimes the mouse support is so so so useful.
