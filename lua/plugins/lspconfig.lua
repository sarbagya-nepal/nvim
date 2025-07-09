return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/schemastore.nvim", -- for better JSON/YAML support
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Capabilities from nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Optional keymaps
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "<leader>gl", vim.diagnostic.open_float)
    end

    -- LSP servers
    local servers = {
      -- Language specific
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
      clangd = {},
      -- Web & React ecosystem
      ts_ls = {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
      },
      html = {},
      cssls = {},
      emmet_language_server = {
        filetypes = {
          "html", "css", "scss", "javascriptreact", "typescriptreact",
        },
      },
      tailwindcss = {
        filetypes = {
          "html", "css", "scss", "javascript", "javascriptreact",
          "typescript", "typescriptreact", "svelte",
        },
        root_dir = lspconfig.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js"
        ),
      },
      eslint = {
        filetypes = {
          "javascript", "javascriptreact", "typescript", "typescriptreact",
        },
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"),
      },
      -- Common config files
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
      -- Optional extras
      marksman = {},       -- Markdown
      dockerls = {},       -- Docker
      prismals = {},       -- Prisma
      graphql = {},        -- GraphQL
    }
    -- Setup LSP servers first
    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      opts.on_attach = on_attach
      lspconfig[name].setup(opts)
    end
  end,
}
