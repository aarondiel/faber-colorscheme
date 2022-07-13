local faber = require("faber")

local colors = {
	red = { color = "#d9595f", fallback = 1 },
	ligth_red = { color = "#f26e74", fallback = 9 },

	green = { color = "#608f73", fallback = 2 },
	light_green = { color = "#82c29c", fallback = 10 },

	yellow = { color = "#e9967e", fallback = 3 },
	light_yellow = { color = "#ecd28b", fallback = 11 },

	blue = { color = "#6791c9", fallback = 4 },
	light_blue = { color = "#7eb3f7", fallback = 12 },

	magenta = { color = "#c488ec", fallback = 5 },
	light_magenta = { color = "#e0aff0", fallback = 13 },

	cyan = { color = "#5ba8b0", fallback = 6 },
	light_cyan = { color = "#7de4f0", fallback = 14 },

	black = { color = "#061115", fallback = 0 },
	grey = { color = "#101b1f", fallback = 8 },
	light_grey = { color = "#212c30", fallback = 7 },
	white = { color = "#edebea", fallback = 15 }
}

local groups = {
	ColorColumn = { fg = nil, bg = colors.grey, style = nil },
}

faber.register_colors(colors)
faber.add_highlight_groups(groups)
