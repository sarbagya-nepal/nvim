return {
  {
    'ethanholz/nvim-lastplace',

    config = function()
      require'nvim-lastplace'.setup{}
    end
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
