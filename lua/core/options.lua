local opt = vim.opt

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers
opt.numberwidth = 2        -- Width of number column

-- Indentation
opt.tabstop = 2           -- Number of spaces a tab counts for
opt.shiftwidth = 2        -- Number of spaces for each indentation level
opt.expandtab = true      -- Convert tabs to spaces
opt.autoindent = true     -- Copy indent from current line
opt.smartindent = true    -- Smart indenting

-- Search
opt.ignorecase = true     -- Ignore case when searching
opt.smartcase = true      -- Override ignorecase if search contains uppercase
opt.hlsearch = true       -- Highlight search results
opt.incsearch = true      -- Show search matches as you type

-- Appearance
opt.termguicolors = true  -- Enable 24-bit RGB colors
opt.background = "dark"   -- Dark background
opt.signcolumn = "yes"    -- Always show sign column
opt.cursorline = true
opt.wrap = false          -- Don't wrap long lines
opt.scrolloff = 8         -- Keep 8 lines visible when scrolling
opt.sidescrolloff = 8     -- Keep 8 columns visible when scrolling

-- Behavior
opt.mouse = "a"           -- Enable mouse support
opt.clipboard = "unnamedplus" -- Use system clipboard
opt.splitright = true     -- Vertical splits go to the right
opt.splitbelow = true     -- Horizontal splits go below
opt.undofile = true       -- Save undo history
opt.swapfile = false      -- Don't create swap files
opt.backup = false        -- Don't create backup files

-- Performance
opt.updatetime = 250      -- Faster completion
opt.timeoutlen = 400      -- Faster key sequence completion

-- makes it easy to use the visual block mode
opt.virtualedit = "block"
opt.inccommand = "split"

-- Extra
opt.wildmenu = true
opt.modifiable = true
opt.cmdheight = 0
opt.showmode = false

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Fixes pasting after visual selection.
vim.keymap.set("v", "p", '"_dP')
