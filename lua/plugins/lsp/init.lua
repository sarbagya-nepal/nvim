return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- load core LSP modules
    local capabilities = require("plugins.lsp.capabilities")
    require("plugins.lsp.diagnostics")
    require("plugins.lsp.keymaps")

    -- load servers
    local servers = {
      "html",
      "cssls",
      "ts_ls",
      "emmet_ls",
      "eslint",
      "lua_ls",
      "tailwindcss",
    }

    for _, server in ipairs(servers) do
      local ok, config = pcall(require, "plugins.lsp.servers." .. server)
      if ok then
        config.capabilities = capabilities
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  end,
}
