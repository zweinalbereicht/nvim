local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- set leader key
-- --Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- window navigation keymaps
keymap('n', '<C-j>', ':wincmd j<CR>', opts)
keymap('n', '<C-k>', ':wincmd k<CR>', opts)
keymap('n', '<C-l>', ':wincmd l<CR>', opts)
keymap('n', '<C-h>', ':wincmd h<CR>', opts)

-- window sizing keymaps
keymap('n', '<S-Up>', ':resize -2<CR>', opts)
keymap('n', '<S-Down>', ':resize +2<CR>', opts)
keymap('n', '<S-Left>', ': vertical resize -2<CR>', opts)
keymap('n', '<S-Right>', ': vertical resize +2<CR>', opts)

-- buffer navigation keymaps
keymap('n', '<S-l>', ':bnext <CR>', opts)
keymap('n', '<S-h>', ':bprev <CR>', opts)
keymap('n', '<leader>c', ':w<CR>:bdelete<CR>', opts)


-- QOL keympas
keymap('i', 'kj', '<ESC>', opts) -- going fom insert to normal quicler
keymap('i', 'jk', '<ESC>', opts)
keymap('v', '$', '$h', opts) -- to select until end of line without the cariage
keymap('n', '<leader>m', ':NvimTreeToggle<CR>', opts) -- open menu
