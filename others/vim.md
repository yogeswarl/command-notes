# VIM - Vi IMproved

## Introduction
- Vim is a text editor that is the next version of the vi editor.
- Vim is a highly configurable text editor built to enable efficient text editing.

## Modes
- Normal Mode: The mode in which you can navigate through the file and perform various operations.
- Insert Mode: The mode in which you can insert text into the file.
- Visual Mode: The mode in which you can select text.
- Visual Line Mode: The mode in which you can select lines.

## Basic Commands
- `Esc`: Exit insert mode.
- `h`: Move cursor left.
- `j`: Move cursor down.
- `k`: Move cursor up.
- `l`: Move cursor right.
- `w`: Move cursor to the beginning of the next word.
- `b`: Move cursor to the beginning of the previous word.
- `e`: Move cursor to the end of the next word.
- `x`: Delete the character under the cursor.
- `s`: Delete the character under the cursor and go into `insert mode`.
- `dd`: Delete the current line.
- `u`: Undo the last change.
- `v`: Enter visual mode.
- `V`: Enter visual line mode.
- `y`: Copy the selected text.
- `p`: Paste the copied text below.
- `P`: Paste the copied text above.
- `:w`: Save the file.
- `:q`: Quit the file.
- `:q!`: Quit the file without saving.
- `:wq`: Save and quit the file.
- `zz`: make the current cursor line the center of the screen.
- `i`: Enter insert mode before the cursor.
- `I`: Enter insert mode at the beginning of the line.
- `a` : Enter insert mode after the cursor.
- `A`: Enter insert mode at the end of the line.
- `o`: Enter insert mode on the next line.
- `O`: Enter insert mode on the previous line.
- `q<letter>`: Inserts into Macro Mode. Can be used to perform the same thing again and again. To close the Macro, Press `q`.
- `@<letter>`: Perform the Macro. 
- `_`: go to the start of line that's a non-whitespace character.
- `$`: go to the end of the line that's a non-whitespace character.
- `0` - go to the start of line inclusive of non-whitespace character
- `f"`: move forward till `"` sign.
- `;`: move to the next found character.
- `,`: move back to the previous found character.
- `t<alphanum>`: move till the `alphanum` character.
- `F<alphanum>`: move backward onto the found `alphanum`. motions to move are reversed. 
- `T<alphanum>`: move backward until the found `alphanum`.
- `d$`: delete from cursor to end of line. **short hand** use `D`
- `d_`: Delete till start of line.
- `dG`: Delete from cursor to end of buffer.
- `dt"`: Delete till `"` sign. Used to delete till a character.
- `S`: Delete the line you are on and go into `insert mode`.
- `c<num><move>` : Delete num lines in `h`,`j`,`k`, or `l` direction
- `<C-u/d>`: `<C-u>` will move half page up, `<C-d>` will move half page down
- `{/}`: move up/down till empty space.
## commands in visual mode
- `:set number`: show line numbers
- `:set scrolloff=8`: keep 8 lines above and below the cursor
- `mB`: mark the current line with a marker `B`. This can later be accessed by `'B`
- `:marks`: show all the markers
- `:reg`: show all the registers
- `:reg a`: show the content of register `a`
- `ctrl + o`: go to the previous location
- `ctrl + i`: go to the next location
- `di{`: delete the insides of a curly brace
- `V + % + d"`: delete everything from the start to end of a curly brace
- `vi{`: select everything on the inside of a curly brace
- `va{`: select everything including the curly braces. `{` can be replaced with anything that has matching open/close. 
- `vi{V`: if somewhere in the middle of a function. do `vi/va` to chose and `V` to enter visual line mode to select the top most line. use motions `y`, `d` to copy or delete the line. 
- `viw/W`- choose within for `w`, choose the whole word until non-whitespace `W`. 
-
## vimrc file setup
- `colorsheme *name*`: create a color scheme to use with vim. 
- `create map bindings`: use mapleader to let vim know that on press of these commands it should execute a command
``` shell
let mapleader = " "
nnoremap <leader>pv :Vex<CR> # creates a vertical split on click of `space+pv`
```
- `plugin installation`: basic example
``` Shell
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nordtheme/vim'
call plug#end()
```

## Easy macros
- `Increment/Decrement a number by one`: create a macro to increment a number by one
    - `q<letter/num>` to start a macro.
    - copy a line.
    - paste it below.
    - `C-a` to increment a number.
    - `C-x` to decrement a number.
    - `q` again to end the macro
    - `@<letter/num>` to call the macro
