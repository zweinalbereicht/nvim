local status_ok, bline = pcall(require, 'bufferline')

if not status_ok then
    return
end

bline.setup {
    options = {
            --numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
            numbers = "superscript" ,--| "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            --right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            --left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            --middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
            -- NOTE: this plugin is designed with this icon in mind,
            -- and so changing this is NOT recommended, this is intended
            -- as an escape hatch for people who cannot bear it for whatever reason
            indicator_icon = '▎',
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            --- name_formatter can be used to change the buffer's label in the bufferline.
            --- Please note some names can/will break the
            --- bufferline so use this at your discretion knowing that it has
            --- some limitations that will *NOT* be fixed.
            max_name_length = 18,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            tab_size = 14,
            diagnostics = "nvim_lsp" ,
            diagnostics_update_in_insert = false,
            -- NOTE: this will be called a lot so don't do any heavy processing here
            offsets = {{filetype = "NvimTree", text = "File Explorer" }},
            show_buffer_icons = true , -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            show_close_icon = true ,
            show_tab_indicators = true ,
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style = "thin" ,--| "thick" | "thin" | { 'any', 'any' }, enforce_regular_tabs = false ,
            always_show_bufferline = true ,
        },
    }