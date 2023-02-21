--Knap keymaps

-- set shorter name for keymap function
local kmap = vim.keymap.set

-- F5 processes the document once, and refreshes the view
kmap({ 'n', 'v', 'i' }, '<F5>', function() require("knap").process_once() end)

-- F6 closes the viewer application, and allows settings to be reset
kmap({ 'n', 'v', 'i' }, '<F6>', function() require("knap").close_viewer() end)

-- F7 toggles the auto-processing on and off
kmap({ 'n', 'v', 'i' }, '<F7>', function() require("knap").toggle_autopreviewing() end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap({ 'n', 'v', 'i' }, '<F8>', function() require("knap").forward_jump() end)

-- Firefox as hot refresher :
local gknapsettings = {
  htmltohtml = "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; sed 's/<\\/head>/<meta http-equiv=\"refresh\" content=\"1\" ><\\/head>/' \"$A\" > \"$B\"",
  htmltohtmlviewerlaunch = "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; firefox \"$B\"",
  htmltohtmlviewerrefresh = "none",
  mdtohtml = "A=%outputfile% ; B=\"${A%.html}-preview.html\" ; pandoc --standalone %docroot% -o \"$A\" && sed 's/<\\/head>/<meta http-equiv=\"refresh\" content=\"1\" ><\\/head>/' \"$A\" > \"$B\" ",
  mdtohtmlviewerlaunch = "A=%outputfile% ; open -a firefox \"${A%.html}-preview.html\"",
  mdtohtmlviewerrefresh = "none",
}

vim.g.knap_settings = gknapsettings

-- Defining my own augroup to remove unecessary files and refresh on save...
-- Basically a long process but I learn stuff doing it, os it's great!

-- TODO check the settings for the md styles, it's a bit ugly for now....

local function clear_md_edit()
  local path = vim.fn.bufname()
  -- need a lil change here, as it seems I don't need an absolute path
  local file1 = string.sub(path, 1, -4) .. ".html"
  local file2 = string.sub(path, 1, -4) .. "-preview.html"
  --
  -- Delete html files
  local cmd = string.format('!rm "%s" "%s"', file1, file2)
  vim.cmd(cmd)
  -- Delete autogroup
  vim.api.nvim_del_augroup_by_name("MdEditGroup")
end

local function knack_actions()

  -- We put everything in a group so that we can delete everything at once
  local groupnr = vim.api.nvim_create_augroup("MdEditGroup", { clear = true })
  knap = require('knap')
  knap.process_once()
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = "MdEditGroup",
    buffer = 0,
    callback = function()
      knap.process_once()
    end, -- Or myvimfun
  })

  -- define function to remove html files and autogroup.

  vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    group = "MdEditGroup",
    buffer = 0,
    callback = clear_md_edit
  })

end

local function activate_knack()
  -- local groupnr = vim.api.nvim_create_augroup("MdGroup")
  vim.api.nvim_buf_create_user_command(0, 'MarkdownEdit', knack_actions, {})
end

-- When entering Md files create autocommand
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md" },
  callback = activate_knack, -- Or myvimfun
})
