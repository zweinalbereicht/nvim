local status_ok, telescope = pcall(require, "telescope")
status_ok_2, telescope_b = pcall(require, "telescope.builtin") -- need this to be global to be understood out of this file
if not (status_ok and status_ok_2) then
  print("telescope plugin not loaded")
  return
end

-- telescope remaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- telescope keymaps
keymap("n", "<leader>ff", ":lua telescope_b.find_files()<CR>", opts)
keymap("n", "<leader>fb", ":lua telescope_b.buffers()<CR>", opts)
keymap("n", "<leader>fh", ":lua telescope_b.help_tags()<CR>", opts)
keymap("n", "<leader>fr", ":lua telescope_b.oldfiles()<CR>", opts)
keymap("n", "<leader>fg", ":lua telescope_b.live_grep({grep_open_files = true})<CR>", opts)
keymap("n", "<leader>fp", ":lua telescope_b.builtin()<CR>", opts)
keymap("n", "<leader>fo", ":lua telescope_b.vim_options()<CR>", opts)

-- telescope setup
telescope.setup({
  defaults = {
    file_ignore_patterns = { "node%_modules",
      "./node%_modules/*",
      "node_modules",
      "./target/*",
      "target" }, -- other configuration values here
    preview = false,
    prompt_prefix = "Be my guest : "
  },
})
