function ColorPencil(opt)
  if opt then
    vim.cmd.colorscheme(opt)
  else
    vim.cmd.colorscheme('kanagawa')
  end
end

ColorPencil()
