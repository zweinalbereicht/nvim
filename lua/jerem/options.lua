-- define all my options
-- enter :h options for a list of options

local options = {
	splitbelow = true,
	splitright = true,
	number = true,
	relativenumber = true,
	numberwidth = 2,
	autoindent = true,
	background = "dark",
	belloff = "all",
	clipboard = "unnamedplus",
	--colorcolumn = {"80"},
	cursorline = true,
	cursorlineopt = "number",
	hlsearch = true,
	ignorecase = false,
	incsearch = true,
	--mouse = false,
	tabstop = 4,
	termguicolors = true,
	softtabstop = 4,
	showtabline = 1,
	wrap = false,
}

for key, value in pairs(options) do
	vim.opt[key]=value
end

