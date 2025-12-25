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

			-- Enable highlighting for ALL installed parsers automatically
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					local buf = vim.api.nvim_get_current_buf()
					local ft = vim.bo[buf].filetype

					-- Skip special filetypes that don't have parsers
					local excluded_fts = {
						"TelescopePrompt",
						"TelescopeResults",
						"",
						"help",
						"lazy",
						"mason",
					}

					for _, excluded in ipairs(excluded_fts) do
						if ft == excluded then
							return
						end
					end

					-- Try to start treesitter if parser exists
					local ok = pcall(vim.treesitter.start)
					if not ok then
						-- Silently ignore if parser doesn't exist
						return
					end
				end,
			})
		end,
	},
}
