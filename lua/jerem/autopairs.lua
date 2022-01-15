local status_ok, npairs = pcall(require,'nvim-autopairs')
if not status_ok then
	print('autopairs not loaded')
	return
end

npairs.setup {
		jcheck_ts = true, -- treesitter related stuff
		ts_config = {
				lua = {'string'},-- it will not add a pair on that treesitter node
				javascript = {'template_string'},
				java = false,-- don't check treesitter on java
		},
		disable_filetype = { "TelescopePrompt" },
		enable_check_bracket_line = true, -- check if there's an open bracket
		fast_wrap = {
				map = '<M-e>',
				chars = { '{', '[', '(', '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
				offset = 0, -- Offset from pattern match
				end_key = '$',
				keys = 'qwertyuiopzxcvbnmasdfghjkl',
				check_comma = true,
				highlight = 'Search',
				highlight_grey='Comment'
		},
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local status_ok, cmp = pcall(require,'cmp')
if not status_ok then
	print('cmp not loaded')
	return
end

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
