-- lua/noor/init.lua
-- Refined Noor Theme - High Polish Version

local M = {}

-- Color palette
local colors = {
	-- Background
	bg_dim = "#141617",
	bg0 = "#141617",
	bg1 = "#1d2021",
	bg2 = "#242627",
	bg3 = "#343837",
	bg4 = "#3c3836",
	bg5 = "#504945",

	-- Float background
	bg_float = "#161819",

	-- Statusline
	bg_statusline1 = "#282828",
	bg_statusline2 = "#32302f",
	bg_statusline3 = "#504945",

	-- Diff/Visuals
	bg_diff_green = "#32361a",
	bg_visual_green = "#333e34",
	bg_diff_red = "#3c1f1e",
	bg_visual_red = "#442e2d",
	bg_diff_blue = "#0d3138",
	bg_visual_blue = "#2e3b3b",
	bg_visual_yellow = "#473c29",
	bg_current_word = "#32302f",

	-- Foreground
	fg0 = "#d4be98",
	fg1 = "#ddc7a1",
	red = "#ea6962",

	-- Accents
	orange = "#e78a4e",
	yellow = "#d8a657",
	green = "#a9b665",
	aqua = "#89b482",
	blue = "#7daea3",
	purple = "#d3869b",
	bg_red = "#ea6962",

	-- Additional
	bg_green = "#a9b665",
	bg_yellow = "#d8a657",
	grey0 = "#7c6f64",
	grey1 = "#7a7a72",
	grey2 = "#a89984",
}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "dark"
	vim.g.colors_name = "noor"

	local highlights = {
		-- Core UI
		Normal = { fg = colors.fg0, bg = colors.bg0 },
		NormalNC = { fg = colors.fg0, bg = colors.bg0 },
		NormalFloat = { fg = colors.fg0, bg = colors.bg_float },
		FloatBorder = { fg = colors.grey1, bg = colors.bg_float },
		SignColumn = { bg = colors.bg0 },
		LineNr = { fg = colors.grey1, bg = colors.bg0 },
		CursorLineNr = { fg = colors.yellow, bg = colors.bg1, bold = true },
		CursorLine = { bg = colors.bg1 },
		ColorColumn = { bg = colors.bg1 },
		Cursor = { reverse = true },
		lCursor = { reverse = true },
		TermCursor = { reverse = true },

		-- Visual
		Visual = { bg = colors.bg_visual_blue },
		VisualNOS = { bg = colors.bg_visual_blue },
		CursorColumn = { bg = colors.bg_current_word },

		-- Search
		Search = { fg = colors.bg0, bg = colors.yellow },
		IncSearch = { fg = colors.bg0, bg = colors.orange },

		-- Popup menu
		Pmenu = { fg = colors.fg0, bg = colors.bg2 },
		PmenuSel = { fg = colors.bg0, bg = colors.blue },
		PmenuSbar = { bg = colors.bg2 },
		PmenuThumb = { bg = colors.grey2 },

		-- Statusline & Tabs
		StatusLine = { fg = colors.fg0, bg = colors.bg_statusline2 },
		StatusLineNC = { fg = colors.grey1, bg = colors.bg_statusline1 },
		TabLine = { fg = colors.grey1, bg = colors.bg_statusline1 },
		TabLineFill = { fg = colors.grey1, bg = colors.bg_statusline1 },
		TabLineSel = { fg = colors.fg0, bg = colors.bg3 },

		-- Syntax
		Comment = { fg = colors.grey1, italic = true },
		Constant = { fg = colors.purple },
		String = { fg = colors.green },
		Character = { fg = colors.purple },
		Number = { fg = colors.purple },
		Boolean = { fg = colors.purple },
		Float = { fg = colors.purple },
		Identifier = { fg = colors.blue },
		Function = { fg = colors.aqua },
		Statement = { fg = colors.red },
		Conditional = { fg = colors.red, italic = true },
		Repeat = { fg = colors.red },
		Label = { fg = colors.red },
		Operator = { fg = colors.orange },
		Keyword = { fg = colors.red, italic = true },
		Exception = { fg = colors.red },
		PreProc = { fg = colors.aqua },
		Include = { fg = colors.aqua },
		Define = { fg = colors.aqua },
		Macro = { fg = colors.aqua },
		PreCondit = { fg = colors.aqua },
		Type = { fg = colors.yellow },
		StorageClass = { fg = colors.orange },
		Structure = { fg = colors.aqua },
		Typedef = { fg = colors.yellow },
		Special = { fg = colors.orange },
		SpecialChar = { fg = colors.orange },
		Tag = { fg = colors.orange },
		Delimiter = { fg = colors.orange },
		SpecialComment = { fg = colors.orange },
		Debug = { fg = colors.orange },

		-- Diagnostic
		Error = { fg = colors.red },
		ErrorMsg = { fg = colors.red },
		WarningMsg = { fg = colors.yellow },
		SpellBad = { sp = colors.red, undercurl = true },
		SpellCap = { sp = colors.blue, undercurl = true },
		SpellLocal = { sp = colors.aqua, undercurl = true },
		SpellRare = { sp = colors.purple, undercurl = true },
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.yellow },
		DiagnosticInfo = { fg = colors.blue },
		DiagnosticHint = { fg = colors.aqua },
		DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
		DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },

		-- Git/Diff
		DiffAdd = { bg = colors.bg_diff_green },
		DiffChange = { bg = colors.bg_visual_yellow },
		DiffDelete = { bg = colors.bg_diff_red },
		DiffText = { bg = colors.bg_visual_blue },

		-- LSP
		LspReferenceText = { bg = colors.bg_visual_blue },
		LspReferenceRead = { bg = colors.bg_visual_green },
		LspReferenceWrite = { bg = colors.bg_visual_red },
		LspSignatureActiveParameter = { fg = colors.yellow, bold = true },
		LspInlayHint = { fg = colors.grey1, italic = true },

		-- Treesitter
		["@function"] = { fg = colors.aqua },
		["@parameter"] = { fg = colors.blue },
		["@keyword.return"] = { fg = colors.red, italic = true },

		-- Completion
		CmpItemAbbr = { fg = colors.fg0 },
		CmpItemAbbrMatch = { fg = colors.yellow, bold = true },
		CmpItemKind = { fg = colors.blue },
		CmpItemMenu = { fg = colors.grey2 },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

local lualine_theme = {
	normal = {
		a = { fg = colors.bg0, bg = colors.yellow, gui = "bold" },
		b = { fg = colors.fg0, bg = colors.bg_statusline2 },
		c = { fg = colors.fg0, bg = colors.bg0 },
	},
	insert = {
		a = { fg = colors.bg0, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg0, bg = colors.bg_statusline2 },
		c = { fg = colors.fg0, bg = colors.bg0 },
	},
	visual = {
		a = { fg = colors.bg0, bg = colors.purple, gui = "bold" },
		b = { fg = colors.fg0, bg = colors.bg_statusline2 },
		c = { fg = colors.fg0, bg = colors.bg0 },
	},
	replace = {
		a = { fg = colors.bg0, bg = colors.red, gui = "bold" },
		b = { fg = colors.fg0, bg = colors.bg_statusline2 },
		c = { fg = colors.fg0, bg = colors.bg0 },
	},
	inactive = {
		a = { fg = colors.grey1, bg = colors.bg_statusline1, gui = "bold" },
		b = { fg = colors.grey1, bg = colors.bg_statusline1 },
		c = { fg = colors.grey1, bg = colors.bg_statusline1 },
	},
}

M.lualine_theme = lualine_theme

return M
