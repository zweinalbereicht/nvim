local colorscheme = "tokyonight"

-- tokyonight specific options
vim.g.tokyonight_style = "dark"
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = false

--safe load of tokyonight
local load_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- double dot stands for string concat
if not load_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
end

