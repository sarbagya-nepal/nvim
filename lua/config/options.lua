local set=vim.opt

set.number=true
set.relativenumber=true
set.numberwidth=2

set.tabstop=2
set.shiftwidth=2
set.expandtab=true
set.autoindent=true
set.smartindent=true

set.ignorecase = true -- Ignore case when searching
set.smartcase = true -- Override ignorecase if search contains uppercase
set.hlsearch = true -- Highlight search results
set.incsearch = true -- Show search matches as you type

set.termguicolors = true
set.background="dark"
set.signcolumn = "yes" -- Always show sign column
set.cursorline=true

-- Backspace
set.backspace = "indent,eol,start"

-- Consider - as part of keyword
set.iskeyword:append("-")

set.clipboard="unnamedplus"

set.wrap = false -- Don't wrap long lines
set.scrolloff = 999 -- Keep 8 lines visible when scrolling
set.sidescrolloff = 10 -- Keep 8 columns visible when scrolling
set.mouse='a'


set.splitright = true
set.splitbelow = true

set.backup=false
set.swapfile=false
set.undofile=true

set.updatetime=250
set.timeoutlen=400

set.virtualedit = "block"
set.inccommand = "split"

-- Extra
set.wildmenu = true
set.modifiable = true
set.cmdheight = 0
set.showmode = false
set.inccommand = 'split'
-- set.spell = true
set.list=true
set.listchars = { tab = '» ', trail = '·', nbsp= '␣' }

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Fixes pasting after visual selection.
vim.keymap.set("v", "p", '"_dP')


set.fileencoding = "utf-8"
