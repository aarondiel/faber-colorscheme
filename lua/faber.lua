local faber = {}
local none_color = { color = "NONE", fallback = "NONE" }

faber.styles = {
	bold = "bold",
	underline = "underline",
	underline_double = "underlineline",
	underline_curly = "undercurl",
	underline_dotted = "underdot",
	underline_dashed = "underdash",
	strikethrough = "strikethrough",
	inverse_foreground_background = "reverse",
	italic = "italic",
	standout = "standout",
	none = "nocombine"
}

faber.colors = { none = none_color }

local function filter(list, condition_function)
	local result = {}

	for _, item in ipairs(list) do
		if condition_function(item) then
			table.insert(result, item)
		end
	end

	return result
end

local function object_map(obj, func)
	local result = {}

	for name, element in pairs(obj) do
		result[name] = func(name, element)
	end

	return result
end

local function object_filter(obj, func)
	local result = {}

	for name, element in pairs(obj) do
		if func(name, element) then
			result[name] = element
		end
	end

	return result
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

	return tostring(fallback_color)
end

local function calculate_color_arguments(color, fg_bg)
	if color == nil then
		return ""
	end

	local true_color = get_true_color(color)
	local fallback_color = get_fallback_color(color)

	local gui = ""
	local cterm = ""

	if true_color ~= nil then
		gui = "gui" .. fg_bg .. "=" .. true_color
	end

	if fallback_color ~= nil then
		cterm = "cterm" .. fg_bg .. "=" .. fallback_color
	end

	return vim.fn.trim(table.concat({ gui, cterm }, " "))
end

local function calculate_style_argument(style)
	local result_style = ""

	if style == nil then
		return nil
	end

	if type(style) == "string" then
		result_style = style
	elseif type(style) == "table" then
		local filtered_style = filter(style, function(style_argument)
			return style_argument ~= faber.styles.none
		end)

		result_style = table.concat(filtered_style, ",")
	end

	assert(type(result_style) == "string", "invalid type for style")
	assert(result_style ~= "", "invalid style")

	return "gui=" .. result_style .. " " .. "cterm=" .. result_style
end

function faber.register_colors(colors)
	faber.colors = colors
	faber.colors.none = none_color

	return faber.colors
end

function faber.get_true_colors()
	local result = object_map(faber.colors, function(_, value)
		return get_true_color(value)
	end)

	result = object_filter(result, function(name, _)
		return name ~= "none"
	end)

	return result
end

function faber.get_fallback_colors()
	local result = object_map(faber.colors, function(_, value)
		return get_fallback_color(value)
	end)

	result = object_filter(result, function(name, _)
		return name ~= "none"
	end)
end

function faber.clear_highlight_group(group_name)
	vim.cmd("highlight clear " .. group_name)
end

function faber.link_highlight_group(from_group, to_group)
	assert(
		type(from_group) == "string",
		"invalid from_group for link_highlight_group"
	)

	assert(
		type(to_group) == "string",
		"invalid to_group for link_highlight_group"
	)

	vim.cmd("highlight! link " .. from_group .. " " .. to_group)
end

function faber.highlight_group(group_name, foreground, background, style)
	local command = {
		"highlight",
		group_name,
		calculate_color_arguments(foreground, "fg"),
		calculate_color_arguments(background, "bg"),
		calculate_style_argument(style)
	}

	command = filter(command, function(cmd)
		return cmd ~= ""
	end)

	if #command == 2 then
		return
	end

	vim.cmd(table.concat(command, " "))
end

function faber.highlight_groups(groups)
	for group_name, group_settings in pairs(groups) do
		local foreground = group_settings["foreground"] or
			group_settings["fg"] or
			group_settings[1]

		local background = group_settings["background"] or
			group_settings["bg"] or
			group_settings[2]

		local style = group_settings["style"] or group_settings[3]

		if group_settings["clear"] then
			faber.clear_highlight_group(group_name)
		end

		if group_settings["link"] ~= nil then
			faber.link_highlight_group(group_name, group_settings["link"])
		end

		faber.highlight_group(
			group_name,
			foreground,
			background,
			style
		)
	end
end

return faber
