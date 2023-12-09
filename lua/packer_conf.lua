vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
      -- Packer can manage itself
      use 'wbthomason/packer.nvim'

      use {
          'nvim-telescope/telescope.nvim', tag = '0.1.0',
          --              -- or                            , branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }
      }

      use {
          'nvim-treesitter/nvim-treesitter',
          run = function()
              local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              ts_update()
          end
      }
      use("nvim-treesitter/playground")
      use {
          'shaunsingh/nord.nvim',
          config = function()
              -- vim.cmd('colorscheme nord')
          end
      }
      use 'Vonr/align.nvim'

--      use {'preservim/nerdcommenter'}
      
      use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup()
          end
      }


      use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},
              {'williamboman/mason.nvim'},
              {'williamboman/mason-lspconfig.nvim'},

              -- Autocompletion
              {'hrsh7th/nvim-cmp'},
              {'hrsh7th/cmp-buffer'},
              {'hrsh7th/cmp-path'},
              {'saadparwaiz1/cmp_luasnip'},
              {'hrsh7th/cmp-nvim-lsp'},
              {'hrsh7th/cmp-nvim-lua'},

              -- Snippets
              -- {'L3MON4D3/LuaSnip'},
              -- {'rafamadriz/friendly-snippets'},
          }
      }
      use { 'mhartington/formatter.nvim' }
      
      use {
          'stevearc/oil.nvim',
          config = function() require('oil').setup() end
      }
      use { 'echasnovski/mini.nvim', branch = 'stable' }      
      -- Install without configuration
      -- use ({ 'projekt0n/github-nvim-theme' })

      -- Or with configuration
      use({
          'projekt0n/github-nvim-theme',
          config = function()
              require('github-theme').setup({
                  -- ...
              })

              -- vim.cmd('colorscheme github_dark')
          end
      })     
     
      use { 'nachumk/systemverilog.vim' } 
      use({
          "p00f/clangd_extensions.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"tamago324/nlsp-settings.nvim",
		}
    })

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
  end)

