return
  {
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
      },
      config = function()
        require('telescope').setup {
          defaults = {
            layout_config = {
              prompt_position = "top",
            },
            sorting_strategy = "ascending", -- required to match prompt-on-top layout
            -- optional: make preview window smaller, or disable if you prefer
            layout_strategy = "horizontal",
          },
          extensions = {
            fzf = {}
          }
        }

        require('telescope').load_extension('fzf')

      end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        -- This is your opts table
        require("telescope").setup {
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
              }
            }
          }
        }
        require("telescope").load_extension("ui-select")
      end
    },
  }
