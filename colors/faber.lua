local faber = require("faber")

local colors = {
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
}

local groups = {
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
	-- SignColumn = { fg = nil, bg = nil, style = nil },
	-- IncSearch = { fg = nil, bg = nil, style = nil },
	-- Substitute = { fg = nil, bg = nil, style = nil },
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
	-- Normal = { fg = nil, bg = nil, style = nil },
	-- NormalFloat = { fg = nil, bg = nil, style = nil },
	-- NormalNC = { fg = nil, bg = nil, style = nil },
	Pmenu = { fg = nil, bg = colors.grey, style = nil },
	PmenuSel = { fg = nil, bg = nil, style = nil },
	PmenuSbar = { fg = nil, bg = colors.white, style = nil },
	PmenuThumb = { fg = nil, bg = colors.black, style = nil },
	-- Question = { fg = nil, bg = nil, style = nil },
	-- QuickFixLine = { fg = nil, bg = nil, style = nil },
	-- Search = { fg = nil, bg = nil, style = nil },
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

	-- *Comment	any comment
	--
	-- *Constant	any constant
	--  String		a string constant: "this is a string"
	--  Character	a character constant: 'c', '\n'
	--  Number		a number constant: 234, 0xff
	--  Boolean	a boolean constant: TRUE, false
	--  Float		a floating point constant: 2.3e10
	--
	-- *Identifier	any variable name
	--  Function	function name (also: methods for classes)
	--
	-- *Statement	any statement
	--  Conditional	if, then, else, endif, switch, etc.
	--  Repeat		for, do, while, etc.
	--  Label		case, default, etc.
	--  Operator	"sizeof", "+", "*", etc.
	--  Keyword	any other keyword
	--  Exception	try, catch, throw
	--
	-- *PreProc	generic Preprocessor
	--  Include	preprocessor #include
	--  Define		preprocessor #define
	--  Macro		same as Define
	--  PreCondit	preprocessor #if, #else, #endif, etc.
	--
	-- *Type		int, long, char, etc.
	--  StorageClass	static, register, volatile, etc.
	--  Structure	struct, union, enum, etc.
	--  Typedef	A typedef
	--
	-- *Special	any special symbol
	--  SpecialChar	special character in a constant
	--  Tag		you can use CTRL-] on this
	--  Delimiter	character that needs attention
	--  SpecialComment	special things inside a comment
	--  Debug		debugging statements
	--
	-- *Underlined	text that stands out, HTML links
	--
	-- *Ignore		left blank, hidden  |hl-Ignore|
	--
	-- *Error		any erroneous construct
	--
	-- *Todo		anything that needs extra attention; mostly the

	CmpItemAbbr = { fg = colors.light_grey, bg = nil, style = nil },
	CmpItemAbbrDeprecated = { fg = colors.grey, bg = nil, style = faber.styles.strikethrough },
	CmpItemAbbrMatch = { fg = colors.white, bg = nil, style = nil },
	-- CmpItemAbbrMatchFuzzy = { fg = nil, bg = nil, style = nil },
	CmpItemKind = { fg = colors.yellow, bg = nil, style = nil },
	-- CmpItemMenu = { fg = nil, bg = nil, style = nil },

	TSAttribute = { fg = colors.red, bg = nil, style = nil },
	TSBoolean = { fg = colors.red, bg = nil, style = nil },
	TSCharacter = { fg = colors.light_yellow, bg = nil, style = faber.styles.italic },
	-- TSCharacterSpecial = { fg = nil, bg = nil, style = nil },
	TSComment = { fg = colors.light_grey, bg = nil, style = nil },
	TSConditional = { fg = colors.yellow, bg = nil, style = nil },
	TSConstant = { fg = colors.red, bg = nil, style = faber.styles.italic },
	TSConstBuiltin = { fg = colors.red, bg = nil, style = faber.styles.italic },
	TSConstMacro = { fg = colors.red, bg = nil, style = faber.styles.italic },
	TSDebug = { fg = colors.light_grey, bg = nil, style = nil },
	TSDefine = { fg = colors.magenta, bg = nil, style = nil },
	-- TSError = { fg = nil, bg = nil, style = nil },
	-- TSException = { fg = nil, bg = nil, style = nil },
	TSField = { fg = colors.cyan, bg = nil, style = faber.styles.none },
	-- TSFloat = { fg = nil, bg = colors.white, style = nil },
	TSFunction = { fg = colors.light_cyan, bg = nil, style = nil },
	TSFuncBuiltin = { fg = colors.light_cyan, bg = nil, style = nil },
	TSFuncMacro = { fg = colors.light_cyan, bg = nil, style = nil },
	TSInclude = { fg = colors.yellow, bg = nil, style = nil },
	TSKeyword = { fg = colors.light_magenta, bg = nil, style = nil },
	TSKeywordFunction = { fg = colors.light_magenta, bg = nil, style = nil },
	TSKeywordOperator = { fg = colors.light_magenta, bg = nil, style = nil },
	TSKeywordReturn = { fg = colors.light_magenta, bg = nil, style = nil },
	TSLabel = { fg = colors.light_magenta, bg = nil, style = nil },
	TSMethod = { fg = colors.light_green, bg = nil, style = nil },
	TSNamespace = { fg = colors.blue, bg = nil, style = nil },
	TSNumber = { fg = colors.white, bg = nil, style = nil },
	TSOperator = { fg = colors.white, bg = nil, style = nil },
	TSParameter = { fg = colors.cyan, bg = nil, style = nil },
	TSParameterReference = { fg = colors.cyan, bg = nil, style = nil },
	TSPreProc = { fg = colors.magenta, bg = nil, style = nil },
	TSProperty = { fg = colors.cyan, bg = nil, style = nil },
	TSPunctDelimiter = { fg = colors.yellow, bg = nil, style = nil },
	TSPunctBracket = { fg = colors.light_blue, bg = nil, style = nil },
	TSPunctSpecial = { fg = colors.light_blue, bg = nil, style = nil },
	TSRepeat = { fg = colors.light_yellow, bg = nil, style = nil },
	TSStorageClass = { fg = colors.green, bg = nil, style = nil },
	TSString = { fg = colors.light_yellow, bg = nil, style = faber.styles.italic },
	TSStringRegex = { fg = colors.red, bg = nil, style = nil },
	TSStringEscape = { fg = colors.red, bg = nil, style = nil },
	TSStringSpecial = { fg = colors.red, bg = nil, style = nil },
	TSSymbol = { fg = colors.light_green, bg = nil, style = nil },
	TSTag = { fg = colors.blue, bg = nil, style = nil },
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
	TSTodo = { fg = colors.white, bg = nil, style = nil },
	TSType = { fg = colors.green, bg = nil, style = nil },
	TSTypeBuiltin = { fg = colors.green, bg = nil, style = nil },
	TSTypeQualifier = { fg = colors.light_green, bg = nil, style = nil },
	TSTypeDefinition = { fg = colors.magenta, bg = nil, style = nil },
	TSVariable = { fg = colors.white, bg = nil, style = faber.styles.italic },
	TSVariableBuiltin = { fg = colors.white, bg = nil, style = faber.styles.italic },

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
}

faber.register_colors(colors)
faber.highlight_groups(groups)
