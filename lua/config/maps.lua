local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
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
vim.api.nvim_create_autocmd({ "FileType" }, { pattern = { 'help' }, callback = function()
    keymap('n', '<leader>g', ':echo "lala"<CR>', opts) -- open menu
end }) -- remap goto in help


-- Autocommands for a run shortcut.
-- We will add languages incrementally as we find it useful in the workflow.

-- lua run
local luaexec = function()
    keymap('n', '<leader><leader>r', ':source %<CR>', {})
end
-- python run
local pythonexec = function()
    keymap('n', '<leader><leader>r', ':!python %<CR>', {})
end

-- rust run
local rustexec = function()
    local p, counter = io.popen("ls . | grep .toml"), 0 -- starts a new process to run bash cmd
    for _ in p:lines() do counter = counter + 1 end
    p:close()

    -- If at base of project, assign the run cmd
    if counter > 0 then
        keymap('n', '<leader><leader>r', ':!cargo run<CR>', {})
    end
end

-- loop through to assign all run functions
local fileexec = {
    lua = luaexec,
    py = pythonexec,
    rs = rustexec
}

for key, value in pairs(fileexec) do
    autocmd({ "BufEnter", "BufWinEnter" }, {
        pattern = { "*." .. key },
        callback = value, -- Or myvimfun
    })
end
