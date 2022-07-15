-- If something is defined lik this and then requires, it will be accessible via the :lua in cmd line mode

-- helper function to print tables and table content
function P(arg)
    print(vim.inspect(arg))
end

function Reload(arg)
    package.loaded[arg]=nil
    require(arg)
end
