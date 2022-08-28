
local buffer_sort_fn = function(buffer_a, buffer_b)
    return buffer_a.id > buffer_b.id
end

local buffer_filter_fn = function(buf, buf_nums)
    return true
end

require "bufferline".setup {
    options = {
        -- numbers = "none" | "ordinal" | "buffer_id" | "both",
        numbers = function(opts)
            return string.format('%s%s', opts.ordinal, opts.raise(opts.id))
        end,

        -- Mouse Actions
        left_mouse_command = "buffer %d",
        right_mouse_command = "vertical sbuffer %d",
        middle_mouse_command = nil,
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"

        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            -- style = 'icon',
            style = 'underline',
        },

        -- -- NOTE: this plugin is designed with this icon in mind,
        -- -- and so changing this is NOT recommended, this is intended
        -- -- as an escape hatch for people who cannot bear it for whatever reason
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        -- --- name_formatter can be used to change the buffer's label in the bufferline.
        -- --- Please note some names can/will break the
        -- --- bufferline so use this at your discretion knowing that it has
        -- --- some limitations that will *NOT* be fixed.
        -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
        --     -- remove extension from markdown files for example
        --     if buf.name:match('%.md') then
        --         return vim.fn.fnamemodify(buf.name, ':t:r')
        --     end
        -- end,
        -- max_name_length = 18,
        -- max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 20,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,

        -- -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = buffer_filter_fn,

        offsets = {
            {filetype = "NvimTree", text = "File Explorer", text_align = "center", highlight = "Directory" },
            {filetype = "coc-explorer", text = "Coc Explorer", text_align = "center", highlight = "Directory" }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current',

        highlights = {
            buffer_selected = {
                guifg = "#EC5241",
                guibg = "#A3BA5E",
                gui = "bold, italic",
            },
        },
    }
}
