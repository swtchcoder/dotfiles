local modes = {
	[vis.modes.NORMAL] = 'N',
	[vis.modes.OPERATOR_PENDING] = 'N',
	[vis.modes.VISUAL] = 'V',
	[vis.modes.VISUAL_LINE] = 'V',
	[vis.modes.INSERT] = 'I',
	[vis.modes.REPLACE] = 'R'
}

vis.events.subscribe(vis.events.WIN_STATUS, function(win)
	local mode = modes[vis.mode] or ''
	local file = win.file.name or '[No Name]'
	local syntax = win.syntax or ''
	local selection = win.selection

	file = file:gsub("^/home/%w+/", "~/")
	if win.file.modified then
		file = file .. '[+]'
	end
	if vis.recording then
		file = file .. '@'
	end

	local left = ' ' .. mode .. '  ' .. file
	local right = ' ' .. syntax .. '  ' ..
		selection.line .. ':' .. selection.col .. ' '
	win:status(left, right)

	win.STYLE_MODE_NORMAL = win.STYLE_LEXER_MAX - 1
	win.STYLE_MODE_VISUAL = win.STYLE_LEXER_MAX - 2
	win.STYLE_MODE_INSERT = win.STYLE_LEXER_MAX - 3
	win.STYLE_MODE_REPLACE = win.STYLE_LEXER_MAX - 4
	win.STYLE_SYNTAX = win.STYLE_LEXER_MAX - 5
	win:style_define(win.STYLE_MODE_NORMAL, 'fore:black,back:blue')
	win:style_define(win.STYLE_MODE_VISUAL, 'fore:black,back:yellow')
	win:style_define(win.STYLE_MODE_INSERT, 'fore:black,back:green')
	win:style_define(win.STYLE_MODE_REPLACE, 'fore:black,back:magenta')
	win:style_define(win.STYLE_SYNTAX, 'fore:white,back:gray')

	local styles = {
		[vis.modes.NORMAL] = win.STYLE_MODE_NORMAL,
		[vis.modes.OPERATOR_PENDING] = win.STYLE_MODE_NORMAL,
		[vis.modes.VISUAL] = win.STYLE_MODE_VISUAL,
		[vis.modes.VISUAL_LINE] = win.STYLE_MODE_VISUAL,
		[vis.modes.INSERT] = win.STYLE_MODE_INSERT,
		[vis.modes.REPLACE] = win.STYLE_MODE_REPLACE
	}
	local style = styles[vis.mode]

	local first = 0
	local last = #mode + 1
	for c = first, last do
		win:style_pos(style, c, win.height - 1)
	end

	first = win.width - #right
	last = first + #syntax + 1
	for c = first, last do
		win:style_pos(win.STYLE_SYNTAX, c, win.height - 1)
	end

	first = last + 1
	last = win.width - 1
	for c = first, last do
		win:style_pos(style, c, win.height - 1)
	end
end)
