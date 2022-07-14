# faber-colorscheme

**WORK IN PROGRESS**

a tool for creating neovim colorschemes that work on terminals with
*truecolor* as well as *base 16*.

this plugin is supposed to make it easier to create colorschemes from scratch
as well as make them work with *termguicolors* enabled or disabled.

## installation

add the colorscheme in your packer config and set the colorscheme
```lua
add({
	"aarondiel/faber-colorscheme",
	config = function()
		vim.cmd("silent colorscheme faber")
	end
})
```

## configuration

you can also import faber in lua using `require("faber")`.

see [data types](#data-types) for an explenation / definition for types like `styles`, `color`, `group`

available properties:
- `styles: styles`
> a table of all of the different styles

- `colors: Record<string, color[]>`
> a table of all colors set by the colorscheme, for this to work `register_colors` has to have been called.
> `colors.none` is automatically added and can be used to clear a foreground or background color

- `register_colors(colors: color[]): color[]`
> save the colors in `colors`, so that they can be imported elsewhere under `faber.colors`

- `clear_highlight_group(group_name: string): void`
> clear highight group with the name `group`

- `link_highlight_group(from_group: string, to_group: string): void`
> link `from_group` to use the highlighting from `from_group`

- `highlight_group(group_name: string, foreground: color, background: color, style: styles[indexof styles])`
> update a single highlight group (`foreground`, `background` and `style` have to be in the default form for faber)

- `highlight_groups(groups: Record<string, group>)`
> calls `highlight_group` for each entry in `groups`

this allows you to make your own colorschemes using the functions defined in this plugin or use the colors elsewhere (for instance for a statusline).

## example
in **.config/nvim/colors/colorscheme.lua** (where colorscheme is the name of your custom colorscheme):

```lua
local faber = require("faber")

local colors = faber.register_colors({
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
	grey = { color = "#282e30", fallback = 8 },
	light_grey = { color = "#9da5a8", fallback = 7 },
	white = { color = "#edebea", fallback = 15 }
})

faber.highlight_groups({
	-- render the colorcolumn in bright red
	ColorColumn = { bg = colors.light_red },

	-- display floating point numbers in yellow, with a green background
	Float = { fg = colors.yellow, bg = colors.green }

	-- the same as above, without the identifiers (order is important: foreground, background, style)
	-- you can also specifiy nil to skip a specifier
	Float = { colors.yellow, colors.green }

	-- show the character under the cursor as italic with inversed foreground and background colors
	Cursor = { style = { faber.styles.italic, faber.styles.inverse_foreground_background } },

	-- display all treesitter comments with the default vim comment highlighting
	TSComment = { link = "Comment" },

	-- remove the highlighting of errors
	Error = { clear = true }
})
```

## data types

typescript-styled types are provided for illustration purposes.

- *null* should be understood as *nil*
- both typescript *objects* as well as *arrays* should be understood as lua *tables*

### color

```typescript
type color = string |
	{ color?: string, fallback?: number | string } |
	[ string, number | string] |
null
```

a **color** can either be a `string`, a `table` or `nil`.

an empty `table` or `nil` results in the color being inherited.

**color.color** sets the true color, only specifying a `string` for **color** has the same affect as providing a table with only **color** filled out.

**color.fallback** is used if *termguicolors* is turned off and uses the specified terminal color number.
(see [default colorscheme](#default-colorscheme) for standart base 16 codes and their corresponding color)

### styles
```typescript
type styles = {
	bold: "bold",
	underline: "underline",
	underline_double: "underlineline",
	underline_curly: "undercurl",
	underline_dotted: "underdot",
	underline_dashed: "underdash",
	strikethrough: "strikethrough",
	inverse_background_foreground: "reverse",
	italic: "italic",
	standout: "standout",
	none: "nocombine"
}
```

**styles** is just a table of different text styles with their internal names
assigned to them.

you could specifiy styles directly with their corresponding string value,
*faber.styles* just provides slightly nicer names.

### group

```typescript
type group = {
	foreground?: color,
	fg?: color,
	background?: color,
	bg?: color,
	style?: styles[keyof styles],
	clear?: bool,
	link?: string
}
```

**group.foreground** and **group.fg** are interchangable, although
**group.foreground** would take precedence over **group.fg**.

the same applies to **group.background** and **group.bg**.

**group.clear** automatically invokes *faber.clear_highlight_group* before
setting the highlight group.

**group.link** automatically invokes *faber.link_highlight_group*

## default colorscheme
| color name    | hex color (truecolor) | base 16 fallback |
|:--------------|:---------------------:|:-----------------|
| red           | `#d9595f`             | 1                |
| light_red     | `#f26e74`             | 9                |
| green         | `#608f73`             | 2                |
| light_green   | `#82c29c`             | 10               |
| yellow        | `#e9967e`             | 3                |
| light_yellow  | `#ecd28b`             | 11               |
| blue          | `#6791c9`             | 4                |
| light_blue    | `#7eb3f7`             | 12               |
| magenta       | `#c488ec`             | 5                |
| light_magenta | `#e0aff0`             | 13               |
| cyan          | `#5ba8b0`             | 6                |
| light_cyan    | `#7de4f0`             | 14               |
| black         | `#061115`             | 0                |
| grey          | `#282e30`             | 8                |
| light_grey    | `#9da5a8`             | 7                |
| white         | `#edebea`             | 15               |

## todo:

- typings using emmy lua
- ability to create custom highlighting groups
