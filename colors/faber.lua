local faber = require("faber")

local colors = faber.register_colors({
	red = { color = "#d9595f", fallback = 1 },
	light_red = { color = "#f26e74", fallback = 9 },

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
	grey = { color = "#282e30", fallback = 8 },
	light_grey = { color = "#9da5a8", fallback = 7 },
	white = { color = "#edebea", fallback = 15 }
})

faber.highlight_groups({
	ColorColumn = { fg = nil, bg = colors.grey, style = nil },
	-- Conceal = { fg = nil, bg = nil, style = nil },
	-- Cursor = { fg = nil, bg = nil, style = nil },
	-- CursorIM = { fg = nil, bg = nil, style = nil },
	-- CursorColumn = { fg = nil, bg = nil, style = nil },
	-- CursorLine = { fg = nil, bg = nil, style = nil },
	-- Directory = { fg = nil, bg = nil, style = nil },
	-- DiffAdd = { fg = nil, bg = nil, style = nil },
	-- DiffChange = { fg = nil, bg = nil, style = nil },
	-- DiffDelete = { fg = nil, bg = nil, style = nil },
	-- DiffText = { fg = nil, bg = nil, style = nil },
	-- EndOfBuffer = { fg = nil, bg = nil, style = nil },
	-- TermCursor = { fg = nil, bg = nil, style = nil },
	-- TermCursorNC = { fg = nil, bg = nil, style = nil },
	-- ErrorMsg = { fg = nil, bg = nil, style = nil },
	-- WinSeparator = { fg = nil, bg = nil, style = nil },
	-- Folded = { fg = nil, bg = nil, style = nil },
	-- FoldColumn = { fg = nil, bg = nil, style = nil },
	SignColumn = { clear = true },
	IncSearch = { clear = true, fg = colors.black, bg = colors.light_yellow, style = nil },
	Substitute = { link = "IncSearch" },
	LineNr = { fg = colors.white, bg = nil, style = nil },
	LineNrAbove = { fg = colors.light_grey, bg = nil, style = nil },
	LineNrBelow = { fg = colors.light_grey, bg = nil, style = nil },
	-- CursorLineNr = { fg = nil, bg = nil, style = nil },
	-- CursorLineSign = { fg = nil, bg = nil, style = nil },
	-- CursorLineFold = { fg = nil, bg = nil, style = nil },
	-- MatchParen = { fg = nil, bg = nil, style = nil },
	-- ModeMsg = { fg = nil, bg = nil, style = nil },
	-- MsgArea = { fg = nil, bg = nil, style = nil },
	-- MsgSeparator = { fg = nil, bg = nil, style = nil },
	-- MoreMsg = { fg = nil, bg = nil, style = nil },
	-- NonText = { fg = nil, bg = nil, style = nil },
	Normal = { fg = colors.white, bg = nil, style = nil },
	-- NormalFloat = { fg = nil, bg = nil, style = nil },
	-- NormalNC = { fg = nil, bg = nil, style = nil },
	Pmenu = { fg = nil, bg = colors.grey, style = nil },
	PmenuSel = { fg = nil, bg = nil, style = nil },
	PmenuSbar = { fg = nil, bg = colors.white, style = nil },
	PmenuThumb = { fg = nil, bg = colors.black, style = nil },
	-- Question = { fg = nil, bg = nil, style = nil },
	-- QuickFixLine = { fg = nil, bg = nil, style = nil },
	Search = { clear = true, fg = colors.grey, bg = colors.yellow, style = nil },
	-- SpecialKey = { fg = nil, bg = nil, style = nil },
	-- SpellBad = { fg = nil, bg = nil, style = nil },
	-- SpellCap = { fg = nil, bg = nil, style = nil },
	-- SpellLocal = { fg = nil, bg = nil, style = nil },
	-- SpellRare = { fg = nil, bg = nil, style = nil },
	-- StatusLine = { fg = nil, bg = nil, style = nil },
	-- StatusLineNC = { fg = nil, bg = nil, style = nil },
	-- TabLine = { fg = nil, bg = nil, style = nil },
	-- TabLineFill = { fg = nil, bg = nil, style = nil },
	-- TabLineSel = { fg = nil, bg = nil, style = nil },
	-- Title = { fg = nil, bg = nil, style = nil },
	-- Visual = { fg = nil, bg = nil, style = nil },
	-- VisualNOS = { fg = nil, bg = nil, style = nil },
	-- WarningMsg = { fg = nil, bg = nil, style = nil },
	-- Whitespace = { fg = nil, bg = nil, style = nil },
	-- WildMenu = { fg = nil, bg = nil, style = nil },
	-- Menu = { fg = nil, bg = nil, style = nil },
	-- Scrollbar = { fg = nil, bg = nil, style = nil },
	-- Tooltip = { fg = nil, bg = nil, style = nil },

	Comment = { fg = colors.light_grey, bg = nil, style = nil },
	Constant = { fg = colors.red, bg = nil, style = faber.styles.italic },
	String = { fg = colors.light_yellow, bg = nil, style = faber.styles.italic },
	Character = { fg = colors.light_yellow, bg = nil, style = faber.styles.italic },
	Number = { fg = colors.white, bg = nil, style = nil },
	Boolean = { link = "Constant" },
	Float = { fg = nil, bg = colors.white, style = nil },
	-- Identifier = { fg = nil, bg = nil, style = nil },
	Function = { fg = colors.light_cyan, bg = nil, style = nil },
	-- Statement = { fg = nil, bg = nil, style = nil },
	Conditional = { fg = colors.yellow, bg = nil, style = nil },
	Repeat = { fg = colors.light_yellow, bg = nil, style = nil },
	Label = { fg = colors.light_magenta, bg = nil, style = nil },
	Operator = { fg = colors.white, bg = nil, style = nil },
	Keyword = { fg = colors.light_magenta, bg = nil, style = nil },
	Exception = { fg = nil, bg = nil, style = nil },
	PreProc = { fg = colors.magenta, bg = nil, style = nil },
	Include = { fg = colors.yellow, bg = nil, style = nil },
	Define = { fg = colors.magenta, bg = nil, style = nil },
	Macro = { fg = colors.red, bg = nil, style = faber.styles.italic },
	-- PreCondit = { fg = nil, bg = nil, style = nil },
	Type = { fg = colors.green, bg = nil, style = nil },
	StorageClass = { fg = colors.green, bg = nil, style = nil },
	-- Structure = { fg = nil, bg = nil, style = nil },
	-- Typedef = { fg = nil, bg = nil, style = nil },
	-- Special = { fg = nil, bg = nil, style = nil },
	SpecialChar = { link = "Character" },
	Tag = { fg = colors.blue, bg = nil, style = nil },
	Delimiter = { fg = colors.yellow, bg = nil, style = nil },
	SpecialComment = { link = "Comment" },
	Debug = { fg = colors.light_grey, bg = nil, style = nil },
	Underlined = { fg = nil, bg = nil, style = faber.styles.underline },
	Ignore = { fg = nil, bg = nil, style = faber.styles.strikethrough },
	Error = { fg = nil, bg = colors.none, style = faber.styles.underline_curly },
	Todo = { fg = colors.white, bg = nil, style = nil },

	CmpItemAbbr = { fg = colors.light_grey, bg = nil, style = nil },
	CmpItemAbbrDeprecated = { fg = colors.grey, bg = nil, style = faber.styles.strikethrough },
	CmpItemAbbrMatch = { fg = colors.white, bg = nil, style = nil },
	-- CmpItemAbbrMatchFuzzy = { fg = nil, bg = nil, style = nil },
	CmpItemKind = { fg = colors.yellow, bg = nil, style = nil },
	-- CmpItemMenu = { fg = nil, bg = nil, style = nil },

	TSAttribute = { fg = colors.red, bg = nil, style = nil },
	TSBoolean = { link = "Boolean" },
	TSCharacter = { link = "Character" },
	TSCharacterSpecial = { link = "SpecialChar" },
	TSComment = { link = "Comment" },
	TSConditional = { link="Conditional" },
	TSConstant = { link = "Constant" },
	TSConstBuiltin = { link = "Constant" },
	TSConstMacro = { link="Macro" },
	TSDebug = { link="Debug" },
	TSDefine = { link="Define" },
	TSError = { link="Error" },
	TSException = { link="Exception" },
	TSField = { fg = colors.cyan, bg = nil, style = faber.styles.none },
	TSFloat = { link = "Float" },
	TSFunction = { link="Function" },
	TSFuncBuiltin = { fg = colors.light_cyan, bg = nil, style = nil },
	TSFuncMacro = { fg = colors.light_cyan, bg = nil, style = nil },
	TSInclude = { link="Include" },
	TSKeyword = { link="Keyword" },
	TSKeywordFunction = { fg = colors.light_yellow, bg = nil, style = nil },
	TSKeywordOperator = { link = "Keyword" },
	TSKeywordReturn = { link = "Keyword" },
	TSLabel = { link="Label" },
	TSMethod = { fg = colors.light_green, bg = nil, style = nil },
	TSNamespace = { fg = colors.blue, bg = nil, style = nil },
	TSNumber = { link = "Number" },
	TSOperator = { link = "Operator" },
	TSParameter = { fg = colors.cyan, bg = nil, style = nil },
	TSParameterReference = { fg = colors.cyan, bg = nil, style = nil },
	TSPreProc = { link="PreProc" },
	TSProperty = { fg = colors.cyan, bg = nil, style = nil },
	TSPunctDelimiter = { link="Delimiter" },
	TSPunctBracket = { fg = colors.light_blue, bg = nil, style = nil },
	TSPunctSpecial = { fg = colors.light_blue, bg = nil, style = nil },
	TSRepeat = { link="Repeat" },
	TSStorageClass = { link="StorageClass" },
	TSString = { link = "String" },
	TSStringRegex = { fg = colors.red, bg = nil, style = nil },
	TSStringEscape = { fg = colors.red, bg = nil, style = nil },
	TSStringSpecial = { fg = colors.red, bg = nil, style = nil },
	TSSymbol = { fg = colors.light_green, bg = nil, style = nil },
	TSTag = { link="Tag" },
	TSTagAttribute = { fg = colors.yellow, bg = nil, style = nil },
	TSTagDelimiter = { fg = colors.light_yellow, bg = nil, style = nil },
	TSText = { fg = colors.white, bg = nil, style = nil },
	TSStrong = { fg = colors.white, bg = nil, style = faber.styles.bold },
	TSEmphasis = { fg = colors.white, bg = nil, style = faber.styles.italic },
	TSUnderline = { fg = colors.white, bg = nil, style = faber.styles.underline },
	TSStrike = { fg = colors.white, bg = nil, style = faber.styles.strikethrough },
	TSTitle = { fg = colors.white, bg = nil, style = nil },
	TSLiteral = { fg = colors.white, bg = nil, style = nil },
	TSURI = { fg = colors.light_green, bg = nil, style = faber.styles.italic },
	TSMath = { fg = colors.light_green, bg = nil, style = faber.styles.bold },
	TSTextReference = { fg = colors.white, bg = nil, style = faber.styles.italic },
	TSEnvironment = { fg = colors.white, bg = nil, style = nil },
	-- TSEnvironmentName = { fg = nil, bg = nil, style = nil },
	TSNote = { fg = colors.light_grey, bg = nil, style = nil },
	TSWarning = { fg = colors.light_red, bg = nil, style = faber.styles.underline_dashed },
	TSDanger = { fg = colors.light_red, bg = nil, style = faber.styles.underline_curly },
	TSTodo = { link="Todo" },
	TSType = { link = "Type" },
	TSTypeBuiltin = { link = "Type" },
	TSTypeQualifier = { link = "Type" },
	TSTypeDefinition = { link = "Type" },
	TSVariable = { fg = colors.white, bg = nil, style = faber.styles.italic },
	TSVariableBuiltin = { link = "TSVariable" },

	NvimTreeSymlink = { fg = colors.white, bg = nil, style = faber.styles.underline_dashed },
	NvimTreeFolderName = { fg = colors.white, bg = nil, style = faber.styles.bold },
	NvimTreeRootFolder = { fg = colors.red, bg = nil, style = { faber.styles.bold, faber.styles.italic }},
	NvimTreeFolderIcon = { fg = colors.light_cyan, bg = nil, style = nil },
	-- NvimTreeFileIcon = { fg = nil, bg = nil, style = nil },
	-- NvimTreeEmptyFolderName = { fg = nil, bg = nil, style = nil },
	-- NvimTreeOpenedFolderName = { fg = nil, bg = nil, style = nil },
	-- NvimTreeExecFile = { fg = nil, bg = nil, style = nil },
	NvimTreeOpenedFile = { fg = nil, bg = nil, style = faber.styles.underline },
	NvimTreeSpecialFile = { fg = colors.light_blue, bg = nil, style = nil },
	-- NvimTreeImageFile = { fg = nil, bg = nil, style = nil },
	-- NimTreeIndentMarker = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLspDiagnosticsError = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLspDiagnosticsWarning = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLspDiagnosticsInformation = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLspDiagnosticsHint = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitDirty = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitStaged = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitMerge = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitRenamed = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitNew = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitDeleted = { fg = nil, bg = nil, style = nil },
	-- NvimTreeGitIgnored = { fg = nil, bg = nil, style = nil },
	-- NvimTreeWindowPicker = { fg = nil, bg = nil, style = nil },
	-- NvimTreeNormal = { fg = nil, bg = nil, style = nil },
	-- NvimTreeEndOfBuffer = { fg = nil, bg = nil, style = nil },
	-- NvimTreeCursorLine = { fg = nil, bg = nil, style = nil },
	-- NvimTreeWinSeparator = { fg = nil, bg = nil, style = nil },
	-- NvimTreeCursorColumn = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileDirty = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileStaged = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileMerge = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileRenamed = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileNew = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileDeleted = { fg = nil, bg = nil, style = nil },
	-- NvimTreeFileIgnored = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLiveFilterPrefix = { fg = nil, bg = nil, style = nil },
	-- NvimTreeLiveFilterValue = { fg = nil, bg = nil, style = nil },
	-- NvimTreeBookmark = { fg = nil, bg = nil, style = nil }

	GitSignsAdd = { fg = colors.light_green, bg = colors.none, style = nil },
	GitSignsChange = { fg = colors.light_yellow, bg = colors.none, style = nil },
	GitSignsDelete = { fg = colors.light_red, bg = colors.none, style = nil }
})
