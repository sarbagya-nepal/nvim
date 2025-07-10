return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          }
        }
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "clangd",
          "ts_ls",
          "html",
          "cssls",
          "emmet_language_server",
          "eslint",
          "tailwindcss",
          "jsonls",
          "yamlls",
          "marksman",
          "dockerls",
          "prismals",
          "graphql",
        },
      })

    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- JavaScript/TypeScript/React/Next.js
          "prettier",
          "prettierd",
          "eslint_d",

          -- Python
          "black",
          "isort",

          -- C/C++
          "clang-format",

          -- Lua (for Neovim config)
          "stylua",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
