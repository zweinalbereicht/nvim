local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- HOW TO ADD NEW PLUGINS
-- Add an entry in the setup, comment the config par, save, source the file, run Packersync, uncomment the config and source.



-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]


-- loading packer
local load_ok, packer = pcall(require, "packer")

-- check if load is successful
if not load_ok then
  return
end

-- initialize
-- packer.init

return require('packer').startup(function()

  -- plugin list
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = require('config.telescope'),
  }

  -- colorschemes
  use 'junegunn/seoul256.vim'
  use 'folke/tokyonight.nvim'
  use "ellisonleao/gruvbox.nvim"
  use {
    "rebelot/kanagawa.nvim",
    config = require('config.colorschemes'),
  }

  --startup screen
  use {
    "goolord/alpha-nvim",
    config = require("config.alpha"),
  }

  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = require("nvim-autopairs").setup {}
  }

  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('config.lualine')
  }

  -- commenting plugin
  use {
    'numToStr/Comment.nvim',
    run = require("Comment").setup()
  }

  --autotags
  use {
    'windwp/nvim-ts-autotag',
    config = require("nvim-ts-autotag").setup {}
  }

  -- lsp installer now mason
  use {
    "williamboman/mason.nvim",
    run = require("mason").setup()
  }

  -- lsp setup and cmp setup
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",
    config = require("config.lsp"),
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('config.treesitter')
  }

  -- bufferline
  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

  -- menu manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = require('config.nvimtree')
  }

  --Goyo trial
  use {
    'junegunn/goyo.vim',
    config = require('config.goyo'),
  }

  -- vim-tmux navigator
  use {
    'alexghergh/nvim-tmux-navigation',
    config = require('config.nvim-tmux'),
  }

  -- fast motion using leap
  use {
    'ggandor/leap.nvim',
    config = require('leap').add_default_mappings(),
  }

  -- markdown preview
  use {
    'frabjous/knap',
    config = require('config.knap'),
  }

  --My plugins

  -- specification of file location on mac or linux.
  local plugin_location = ''
  if vim.loop.os_uname().sysname == 'Darwin' then
    plugin_location = '/Users/jeremie/Sandbox/neovim_plugins/'
  else
    plugin_location = '/home/jeremie/neovim_plugins/'
  end

  use {
    plugin_location .. 'cell-vim',
    -- run = require('cellvim'),
  }
  --[[




    


  --[[
    



    use {
        "akinsho/toggleterm.nvim",
        tag = 'v1.*',
        config = require("config.toggleterm")
    }

    -- ex Goyo plugin
    use {
        "Pocco81/TrueZen.nvim",
        config = require('config.truezen')
    }

    

--]]

end)
