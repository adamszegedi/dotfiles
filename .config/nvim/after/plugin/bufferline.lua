require("bufferline").setup({
    options = {
        separator_style = 'thin',
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = "File Explorer",
                text_align = "left",
                separator = false
            }
        }
    },
})
