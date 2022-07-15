local M = {}


M.activate = function()
    vim.cmd('Goyo')
    print(vim.g.colors_name)
    if vim.g.colors_name == 'kanagawa' then
        vim.cmd('colorscheme seoul256')
    else
        vim.cmd('colorscheme kanagawa')
    end
end

-- print('close to execution!')
-- User cmd for nice editing in goyo mode with changed
vim.api.nvim_create_user_command('ChillEdit', 'lua require("config.goyo").activate()', {})
-- vim.api.nvim_create_user_command('ChillExit', 'lua require("config.goyo").deactivate()', {})
-- vim.cmd("command ChillEdit lua require('config.goyo').activate()")
-- vim.cmd("command ChillExit lua require('config.goyo').deactivate()")

return M
