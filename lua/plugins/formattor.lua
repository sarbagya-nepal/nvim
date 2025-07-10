return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({

				format_on_save = {
					lsp_fallback = true,
					timeout_ms = 1000,
				},
				formatters_by_ft = {
					-- C/C++
					c = { "clang_format" },
					cpp = { "clang_format" },
					lua = { "stylua" },

					-- Python
					python = { "black" },

					-- JavaScript / React
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },

					-- Optional: Also format these if used in React projects
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
				},
			})
		end,
	},
}
