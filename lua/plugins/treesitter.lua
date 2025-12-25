return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			-- Install parsers
			treesitter.install({
				"lua",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"json",
			})

			-- Enable highlighting with autocmd
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "lua", "html", "css" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
