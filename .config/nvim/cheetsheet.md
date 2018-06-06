# Neovim Cheet Sheet

## Cursor movement

- `h` - move cursor left
- `j` - move cursor down
- `k` - move cursor up
- `l` - move cursor right
- `w` - jump forwards to the start of a word
- `e` - jump forwards to the end of a word
- `b` - jump backwards to the start of a word
- `0` - jump to the start of the line
- `^` - jump to the first non-blank character of the line<
- `$` - jump to the end of the line
- `gg` - go to the first line of the document
- `G` - go to the last line of the document
- `5G` - go to line 5
- `Ctrl+f` - move forward one full screen
- `Ctrl+b` - move back one full screen

## Insert mode

- `i` - insert before the cursor
- `A` - insert (append) at the end of the line<
- `o` - append (open) a new line below the current line
- `Ctrl+c` - exit insert mode

## Editing

- `u` - undo
- `Ctrl+r` - redo
- `.` - repeat last command

## Visual mode

- `v` - start visual mode, mark lines, then do a command (like y-yank)
- `V` - start linewise visual mode
- `Ctrl+v` - start visual block mode
- `aw` - mark a word
- `ab` - a block with ()
- `aB` - a block with {}
- `ib` - inner block with ()
- `iB` - inner block with {}
- `y` - yank (copy) marked text
- `d` - delete marked text
- `Ctrl+c` - exit insert mode

## Cut and paste
