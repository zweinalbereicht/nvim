-- general options
require 'jerem.options'
--require('settings')

-- general remaps
require 'jerem.maps'
--require('maps')

-- plugins with packer
require 'jerem.plugins'

-- colorscheme call
require 'jerem.colorschemes'

-- completion engine
require 'jerem.cmp'

-- lsp setup
require 'jerem.lsp' -- when requiring folder, will alwayd require the init.lua inside

-- telescope setup
require 'jerem.telescope'

-- treesitter
require 'jerem.treesitter'

-- autopairs
require 'jerem.autopairs'

-- status line
require 'jerem.lualine'
