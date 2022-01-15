local status_ok, telescope = pcall(require,'telescope')
status_ok_2, telescope_b = pcall(require,'telescope.builtin') -- need this to be global to be understood out of this file
if not (status_ok and status_ok_2) then
	print('telescope plugin not loaded')
	return
end

-- telescope remaps
local keymap = vim.api.nvim_set_keymap
local opts={noremap=true}

-- telescope keymaps
keymap('n','<leader>ff',":lua telescope_b.find_files()<CR>",opts)
keymap('n','<leader>fg',":lua telescope_b.live_grep()<CR>",opts)
keymap('n','<leader>fb',":lua telescope_b.buffers()<CR>",opts)
keymap('n','<leader>fh',":lua telescope_b.help_tags()<CR>",opts)

-- telescope setup
telescope.setup {
		defaults = {
		},
		-- other configuration values here
}
