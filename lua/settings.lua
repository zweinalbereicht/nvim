local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global settings
o.hlsearch = true
o.incsearch = true
o.autoindent = true
o.bg = "dark"
--o.bg = "light"
o.belloff = "all"

-- window setings
wo.number = true
wo.wrap = true

-- buffer settings
bo.expandtab = true
bo.shiftwidth = 4
bo.sts = 8 --default for typescript
