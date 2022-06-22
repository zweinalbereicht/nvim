local M = {}


M.activate = function()
    vim.cmd('Goyo')
    vim.cmd('colorscheme seoul256')
end

M.deactivate = function()
    vim.cmd('Goyo!')
    vim.cmd('colorscheme kanagawa')
end

print('close to execution!')
vim.cmd("command ChillEdit lua require('config.goyo').activate()")
vim.cmd("command ChillExit lua require('config.goyo').deactivate()")

return M
