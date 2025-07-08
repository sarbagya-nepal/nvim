return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Add LSP capabilities from nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Optional: common on_attach function for LSP keymaps
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end

      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "<leader>e", vim.diagnostic.open_float)
    end

    -- List of servers and any custom config if needed
    local servers = {
      pyright = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
          },
        },
      },
      html = {},
      cssls = {},
      ts_ls = {},
      emmet_language_server = {},
      eslint = {},
      clangd = {},
    }

    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      opts.on_attach = on_attach
      lspconfig[name].setup(opts)
    end
  end,
}
