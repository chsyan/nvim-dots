local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end

local use = require('packer').use

return require('packer').startup({ function()
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'kyazdani42/nvim-web-devicons', event = 'BufEnter' }

  -- Colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }

  -- LSP zero sensible defaults
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
      {'hrsh7th/cmp-nvim-lsp'},     
      {'hrsh7th/cmp-buffer'},       
      {'hrsh7th/cmp-path'},         
      {'saadparwaiz1/cmp_luasnip'}, 
      {'hrsh7th/cmp-nvim-lua'},     

      -- Snippets
      {'L3MON4D3/LuaSnip'},            
      {'rafamadriz/friendly-snippets'},

      -- Symbols
      {'onsails/lspkind.nvim'}
    }
  }

  -- LSP loader
  use { 
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
   }

  -- Copilot
  use { 
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    config = function()
      require("copilot").setup({
        suggestion = { 
          enabled = true,
          auto_trigger = true,
         },
        panel = { enabled = false },
        filetypes = {
          ["."] = true,
        },
      })
    end
  }
  use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup({
        method = "getCompletionsCycling",
        formatters = {
          insert_text = require("copilot_cmp.format").remove_existing
        },
    })
  end
  }

  -- Telescope 
  use {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('plugins/telescope')
    end
  }


  -- Harpoon navigation



  if packer_bootstrap then
    require('packer').sync()
  end

end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } })
