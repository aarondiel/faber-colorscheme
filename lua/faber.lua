local none_color = { color = "NONE", fallback = "NONE" }
local faber = {}

local function opt_return(opt)
	return opt
end

local function get_true_color(color)
	if type(color) == "string" then
		return color
	end

	if type(color) == "table" then
		return color.color or color[1]
	end
end

local function get_fallback_color(color)
	if type(color) ~= "table" then
		return
	end

	local fallback_color = color.fallback or color[2]

	return fallback_color
end

local function get_opt_return(style)
	if (
		style ~= nil and
		type(style) == "function"
	) then
		return style()
	else
		return nil
	end
end

local function get_special_color(style)
	return (
		get_opt_return(style.underline) or
		get_opt_return(style.underline_double) or
		get_opt_return(style.underline_curly) or
		get_opt_return(style.underline_dotted) or
		get_opt_return(style.underline_dashed)
	)
end

faber.styles = {
	bold = true,
	underline = opt_return,
	underline_double = opt_return,
	underline_curly = opt_return,
	underline_dotted = opt_return,
	underline_dashed = opt_return,
	strikethrough = true,
	reverse_foreground_background = true,
	italic = true,
	standout = true
}

faber.colors = { none = none_color }

--- type group = {
-- 	fg: Color,
-- 	bg: Color,
-- 	style: Style, faber.styles.underline(Color),
-- 	default: boolean,
-- 	link: String
-- }

function faber.get_true_colors()
	local result = {}

	for color_name, color_value in pairs(faber.colors) do
		result[color_name] = get_true_color(color_value)
	end

	return result
end

function faber.get_fallback_colors()
	local result = {}

	for color_name, color_value in pairs(faber.colors) do
		result[color_name] = get_fallback_color(color_value)
	end

	return result
end

function faber.register_colors(colors)
	faber.colors = colors
	faber.colors.none = none_color

	return faber.colors
end

function faber.highlight_group(name, fg, bg, style, default)
	if style == nil then
		style = {}
	elseif type(style) ~= "table" then
		style = { style }
	end

	vim.api.nvim_set_hl(0, name, {
		fg = get_true_color(fg),
		bg = get_true_color(bg),
		sp = get_special_color(style),
		font = get_opt_return(style.font),
		bold = style.bold or false,
		italic = style.italic or false,
		reverse = style.reverse_foregroun_background or false,
		standout = style.standout or false,
		underline = style.underline or false,
		underlineline = style.underline_double or false,
		undercurl = style.unerline_curly or false,
		underdot = style.underline_dotted or false,
		underdashed = style.underline_dashed or false,
		strikethrough = style.strikethrough or false,
		default = default or false,
		ctermfg = get_fallback_color(fg),
		ctermbg = get_fallback_color(bg)
	})
end

function faber.link_highlight_group(from, to)
	vim.cmd("highlight! link " .. from .. " " .. to)
end

function faber.highlight_groups(groups)
	for group_name, group_settings in pairs(groups) do
		if group_settings.link ~= nil then
			faber.link_highlight_group(group_name, group_settings.link)
			goto continue
		end

		local foreground = group_settings["foreground"] or
			group_settings["fg"] or
			group_settings[1]

		local background = group_settings["background"] or
			group_settings["bg"] or
			group_settings[2]

		local style = group_settings["style"] or
			group_settings[3]

		local default = group_settings["default"] or
			group_settings[4]

		faber.highlight_group(
			group_name,
			foreground,
			background,
			style,
			default
		)

		::continue::
	end
end

return faber
