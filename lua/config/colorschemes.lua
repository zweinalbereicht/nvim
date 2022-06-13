--local colorscheme = "tokyonight"
--local colorscheme = "seoul256"
--local colorscheme = "gruvbox"
local colorscheme = "kanagawa"

-- tokyonight specific options
vim.g.tokyonight_style = "dark"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = false

-- specific setup
if colorscheme == "kanagawa" then
    -- Default options:
    require('kanagawa').setup({
        undercurl = true,           -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true},
        specialReturn = true,       -- special highlight for the return keyword
        specialException = true,    -- special highlight for exception handling keywords
        transparent = true,        -- do not set background color
        dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
        globalStatus = false,       -- adjust window separators highlight for laststatus=3
        colors = {},
        overrides = {},
    })
end

local load_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- double dot stands for string concat
if not load_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
end
