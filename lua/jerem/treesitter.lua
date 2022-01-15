local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	print('treesitter not loaded')
	return
end

treesitter.setup {
		ensure_installed = "maintained",-- One of "all", "maintained" (parsers with maintainers), or a list of languages
		sync_install = false,-- Install languages synchronously (only applied to `ensure_installed`)
		ignore_install = { "javascript" },-- List of parsers to ignore installing
		highlight = {
				enable = true,-- `false` will disable the whole extension
				disable = {""},-- list of language that will be disabled

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = true,
		},
		indent = {
				enable = true,
		},
		rainbow = {
				enable = true, -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
		},
}
