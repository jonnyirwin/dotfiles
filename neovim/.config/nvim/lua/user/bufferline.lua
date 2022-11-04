local status_ok, bufferl = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferl.setup {
	options = {
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
	}
}
