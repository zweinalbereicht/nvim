local load_success, nvim_tmux_nav = pcall(require, 'nvim-tmux-navigation')
if not load_success then
  print('nvim-tmux-navigation not loaded')

else

  nvim_tmux_nav.setup {
    disable_when_zoomed = true -- defaults to false
  }

  vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
  vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
  vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
  vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
  vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

end
