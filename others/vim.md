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

# commands in visual mode
- `:set number`: show line numbers
- `:set scrolloff=8`: keep 8 lines above and below the cursor
- `mB`: mark the current line with a marker `B`. This can later be accessed by `'B`


# vimrc file setup
- `colorsheme *name*`: create a color scheme to use with vim. 
- `create map bindings`: use mapleader to let vim know that on press of these commands it should execute a command
``` shell
let mapleader = " "
nnoremap <leader>pv :Vex<CR> # creates a vertical split on click of `space+pv`
```