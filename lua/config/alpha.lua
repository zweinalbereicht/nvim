-- local M = {}
--
-- local M.activate() =

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[   ____  _  _  ____   __   __ _   __   __    ____  ____  ____  ____   __    ___  _  _  ____  ]],
    [[  (__  )/ )( \(  __) (  ) (  ( \ / _\ (  )  (  _ \(  __)(  _ \(  __) (  )  / __)/ )( \(_  _) ]],
    [[   / _/ \ /\ / ) _)   )(  /    //    \/ (_/\ ) _ ( ) _)  )   / ) _)   )(  ( (__ ) __ (  )(   ]],
    [[  (____)(_/\_)(____) (__) \_)__)\_/\_/\____/(____/(____)(__\_)(____) (__)  \___)\_)(_/ (__)  ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
    [[                                                                                             ]],
}

dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>"),
    dashboard.button("q", "  F**k off mate", ":qa<CR>"),
}

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
