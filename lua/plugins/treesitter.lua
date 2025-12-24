return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    vim.opt.termguicolors = true
    vim.cmd("syntax enable")

    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then return end

    ts_configs.setup {
      ensure_installed = { "html","css","scss","javascript","typescript","tsx","json","lua" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
