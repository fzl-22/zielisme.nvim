local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
	return
end

bufferline.setup({
	options = {
		numbers = "none", 
		close_command = "Bdelete! %d", 
		right_mouse_command = "Bdelete! %d", 
		left_mouse_command = "buffer %d", 
		middle_mouse_command = nil, 
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 30,
		max_prefix_length = 30, 
		tab_size = 21,
		diagnostics = "nvim_lsp", 
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		update_in_insert = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
        text_align = "left",
        separator = true,
			},
		},
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = true, 
		separator_style = "thin", 
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
	highlights = require("catppuccin.special.bufferline").get_theme(),
})
