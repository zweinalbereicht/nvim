-- define all my options
-- enter :h options for a list of options

local options = {
  cmdheight = 3,
  --nocompatible = true,
  splitbelow = true,
  splitright = true,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  autoindent = true,
  background = "dark",
  belloff = "all",
  clipboard = "unnamedplus",
  -- colorcolumn = { "100" },
  cursorline = false,
  cursorlineopt = "number",
  hlsearch = true,
  ignorecase = false,
  incsearch = true,
  mouse = 'a',
  scrolloff = 8,
  expandtab = true,
  termguicolors = true,
  softtabstop = 2,
  tabstop = 2,
  shiftwidth = 2,
  showtabline = 0,
  wrap = true,
  signcolumn = "yes" -- displays the gutter on the right
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

-- additional stuff
vim.cmd [[set nocompatible]]
