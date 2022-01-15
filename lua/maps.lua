local map=vim.api.nvim_set_keymap

-- leader key
map('n','<Space>','',{})
vim.g.mapleader = ' '

-- window navigation
local options = {noremap = true}
map('n','C-j',':wincmd j<cr>',options)
map('n','C-k',':wincmd k<cr>',options)
map('n','C-h',':wincmd h<cr>',options)
map('n','C-l',':wincmd l<cr>',options)


--terminal navigation
map('n','C-m',':vertical termnal<cr>',options)

--open init.lua
map('n','<leader>;',':w<cr>:e ~/.config/nvim/init.lua<cr>',options)
