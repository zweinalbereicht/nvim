-- If something is defined lik this and then requires, it will be accessible via the :lua in cmd line mode

-- helper function to print tables and table content
function P(arg)
    print(vim.inspect(arg))
end

function Reload(arg)
    package.loaded[arg] = nil
    require(arg)
end

-- edit config file
vim.api.nvim_create_user_command('EditConfig', ":e /Users/jeremie/.config/nvim/init.lua", {})

-- go to start screen
vim.api.nvim_create_user_command('StartScreen', ":lua require('alpha').start() ", {})

--start live-server

local function start_live_server()
    local curr_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_command(":te live-server")
    vim.api.nvim_command(":buffer " .. curr_buf)
end

vim.api.nvim_create_user_command('LiveServer', start_live_server, {})
