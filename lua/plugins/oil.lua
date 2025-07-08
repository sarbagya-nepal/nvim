return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function ()
    require("oil").setup({
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    })
  end,
}
