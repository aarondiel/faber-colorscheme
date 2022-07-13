# faber-colorscheme

**WORK IN PROGRESS**

a tool for creating neovim colorschemes that work on terminals with *truecolor* as well as *base 16*.

## installation

add the colorscheme in your packer config and set the colorscheme
```lua
add({
	"aarondiel/faber-colorscheme",
	config = function()
		vim.cmd("colorscheme faber")
	end
})
```

## configuration

you can also import faber in lua using `require("faber")`.

available properties:
- `colors`
> a table of all colors set by the colorscheme, for this to work `register_colors` has to have been called

- `register_colors(colors)`
> save the colors in `colors`, so that they can be imported elsewhere under `faber.colors`

- `add_highlight_group(group_name, foreground, background, style)`
> add a single highlight group (`foreground`, `background` and `style` have to be in the default form for faber)

- `add_highlight_groups(groups)`
> calls `add_highlight_group` for each entry in `groups`

this allows you to make your own colorschemes using the functions defined in this plugin or use the colors elsewhere (for instance for a statusline).

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
| grey          | `#101b1f`             | 8                |
| light_grey    | `#212c30`             | 7                |
| white         | `#edebea`             | 15               |
