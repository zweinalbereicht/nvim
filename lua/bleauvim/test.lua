local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


local filename = "~/.config/nvim/lua/bleauvim/bleau_boulders.json"
local filename = "bleau_boulders.json"
local bleau_boulders = vim.fn.json_decode(vim.fn.readfile(filename))
--
-- our picker function: colors
local boulders = function(opts)
  opts = opts or {}
  pickers.new(opts,
  {
    prompt_title = "Bleau's boulders",
    finder = finders.new_table {
      results = bleau_boulders,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name .. " - " .. entry.sector,
          ordinal = entry.name,
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        print(vim.inspect(selection))
        vim.api.nvim_put({ selection.display }, "", false, true)
      end)
      return true
    end,
  }):find()
end

boulders()

-- to execute the function
-- print(vim.inspect(require("telescope.themes").get_dropdown{}))
-- colors(require("telescope.themes").get_dropdown{})

-- local filename = './bleau_boulders_ex.json'
-- local bleau_boulders = vim.fn.json_decode(vim.fn.readfile(filename))
-- -- print(vim.inspect(bleau_boulders))
-- local first_boulder = bleau_boulders[1]
-- print(vim.inspect(first_boulder))
--
-- -- ok c'est bon ! 
-- print("name : " .. first_boulder.name .. ", grade : " .. first_boulder.Grade)
