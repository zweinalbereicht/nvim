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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

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
    use 'lunarvim/colorschemes'
    use {
        "rebelot/kanagawa.nvim",
        config = require('config.colorschemes'),
    }

    --startup screen
    use
    {
        "goolord/alpha-nvim",
        config = require("config.alpha"),
    }

    -- auto completion plugins

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = require("nvim-autopairs").setup {}
    }

    -- lsp installer
    use {
        "williamboman/nvim-lsp-installer",
        config = require('nvim-lsp-installer').setup {}
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
        config = require("config.lsp"),
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = require('config.treesitter')
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require('config.lualine')
    }

    use {
        "akinsho/toggleterm.nvim",
        tag = 'v1.*',
        config = require("config.toggleterm")
    }


    -- bufferline
    --use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- menu manager
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = require('config.nvimtree')
    }

    -- ex Goyo plugin
    use {
        "Pocco81/TrueZen.nvim",
        config = require('config.truezen')
    }

    --Goyo trial
    use {
        'junegunn/goyo.vim',
        config = require('config.goyo'),
    }




end)
