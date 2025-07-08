local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- comment will not follow to the next line
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.g.editorconfig = true

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  desc = "Highlight when yanking text",
})

-- Remove trailing whitespace on save
autocmd("BufWritePre", {
  group = augroup("remove_trailing_whitespace", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
  desc = "Remove trailing whitespace on save",
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
  group = augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
  desc = "Auto-resize splits when window is resized",
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = augroup("close_with_q", { clear = true }),
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
  desc = "Close certain filetypes with q",
})


-- Displays the warning of lsp
vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})
