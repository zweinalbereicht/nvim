-- displaying our own statusline

-- table to store the info
local mode_map = {
	['n'] = 'normal ',
	['no'] = 'n·operator pending ',
	['v'] = 'visual ',
	['V'] = 'v·line ',
	[''] = 'v·block ',
	['s'] = 'select ',
	['S'] = 's·line ',
	[''] = 's·block ',
	['i'] = 'insert ',
	['R'] = 'replace ',
	['Rv'] = 'v·replace ',
	['c'] = 'command ',
	['cv'] = 'vim ex ',
	['ce'] = 'ex ',
	['r'] = 'prompt ',
	['rm'] = 'more ',
	['r?'] = 'confirm ',
	['!'] = 'shell ',
	['t'] = 'terminal '
}

-- function to get the info
local function mode()
	local m = vim.api.nvim_get_mode().mode
	if mode_map[m] == nil 
                then 
                        return m 
                end
	return mode_map[m]
end

-- vimscript commands to choose highlight groups
vim.api.nvim_exec(
[[
  hi PrimaryBlock   ctermfg=06 ctermbg=00
  hi SecondaryBlock ctermfg=08 ctermbg=00
  hi Blanks   ctermfg=07 ctermbg=00
]], false)

local stl = {
  '%#PrimaryBlock#',
  mode(),
  '%#SecondaryBlock#',
  '%#Blanks#',
  '%F',
  '%m',
  '%=',
  '%#SecondaryBlock#',
  '%l,%c ',
  '%#PrimaryBlock#',
  '%{&filetype}',
}

-- setting the actual statusline
vim.o.statusline = table.concat(stl)

