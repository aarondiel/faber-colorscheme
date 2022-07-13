local faber = {}

faber.styles = {
	bold = "bold",
	underline = "underline",
	underlineline = "underlineline",
	undercurl = "undercurl",
	underdot = "underdot",
	underdash = "underdash",
	strikethrough = "strikethrough",
	inverse = "reverse",
	italic = "italic",
	standout = "standout",
	none = "nocombine"
}

faber.colors = {}

function faber.register_colors(colors)
	faber.colors = colors
end

function faber.add_highlight_group(group_name, foreground, background, style)
	local group_options = {
		cterm = style,
		gui = style
	}

	if foreground ~= nil then
		group_options.ctermfg = foreground["fallback"]
		group_options.guifg = foreground["color"]
	end

	if background ~= nil then
		group_options.ctermbg = background["fallback"]
		group_options.guibg = background["color"]
	end

	vim.highlight.create(group_name, group_options, false)
end

function faber.add_highlight_groups(groups)
	for group_name, group_settings in pairs(groups) do
		local foreground = group_settings["foreground"] or group_settings["fg"]
		local background = group_settings["background"] or group_settings["bg"]
		local style = group_settings["style"] or group_settings["s"]

		faber.add_highlight_group(
			group_name,
			foreground,
			background,
			style
		)
	end
end

return faber
