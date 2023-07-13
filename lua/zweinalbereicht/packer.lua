-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- colors
  use "rebelot/kanagawa.nvim"

  -- telecope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- nvimtree setup
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { {'nvim-tree/nvim-web-devicons'} }
  }

  -- easy lsp setup
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    {'rafamadriz/friendly-snippets'}
  }
}

  use {
    'nvim-treesitter/nvim-treesitter',
    run= ':TSUpdate'
}

  -- commenting plugin
  use {
    'numToStr/Comment.nvim',
    run = require("Comment").setup()
  }

  -- vim-tmux navigator
  use {
    'alexghergh/nvim-tmux-navigation'
  }

  -- startscreen
  use {
    "goolord/alpha-nvim",
  }

end)
