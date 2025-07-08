local keymap = vim.keymap.set

-- Set leader key (prefix for custom mappings)
vim.g.mapleader = " "      -- Space as leader key
vim.g.maplocalleader = " "

--jk exit insert mode
keymap("i", "jk", "<ESC>")

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- Move to first symbol on the line
keymap("n", "H", "^")

-- Move to last symbol of the line
keymap("n", "L", "$")

-- General keymaps
keymap("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--Buffer Nav
keymap("n", "<tab>", ":bn<CR>", { silent = true, noremap = true })
keymap("n", "<S-tab>", ":bp<CR>", { silent = true, noremap = true })
keymap("n", "<leader>x", ":bd<CR>", opts)

-- Tab management
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move lines up/down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Open Oil file explorer
keymap('n', '-', ':Oil --float<CR>', { noremap = true, silent = true, })
keymap('n', '<leader>e', ':Oil --float<CR>', { noremap = true, silent = true, })

-- Telescope keybindings
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>fr', builtin.oldfiles, {})
keymap('n', '<leader>fc', function()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end)
