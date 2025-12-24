
-- lua/lsp/on_attach.lua
local M = {}

M.on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap=true, silent=true })
  end

  -- LSP keymaps
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
end


vim.lsp.enable("lua_ls")
vim.lsp.enable("html")
vim.lsp.enable("emmet_ls")

return M
