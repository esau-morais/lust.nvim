local lush = require("lush")
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- See :h highlight-groups

		-- ColorColumn    { }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		CurSearch({ bg = "#ffc093", fg = "black", bold = true, italic = false }), -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine({ bg = hsl("#403d3b").da(20) }), -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory({ fg = String.fg }), -- Directory names (and other special names in listings)
		DiffAdd({ fg = "#6cb6a0" }), -- Diff mode: Added line |diff.txt|
		DiffChange({ fg = "#ffd8ae" }), -- Diff mode: Changed line |diff.txt|
		DiffDelete({ fg = "#ff8290" }), -- Diff mode: Deleted line |diff.txt|
		-- DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer({ link = "NonText" }), -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg({ fg = "#ffbec7" }), -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		-- Folded         { }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		IncSearch({ CurSearch }), -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute({ CurSearch }), -- |:substitute| replacement text highlighting
		LineNr({ fg = hsl("#a08264").lightness(36) }), -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set. LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		CursorLineNr({ fg = Normal.fg }), -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen({ bg = "#524f4c" }), -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		NonText({ fg = "#524f4c" }), -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal({ bg = hsl(26, 8, 10), fg = "#e8e7e7" }), -- Normal text
		NormalFloat({ bg = Normal.bg.li(2) }), -- Normal text in floating windows.
		FloatBorder({ NormalFloat }), -- Border of floating windows.
		-- FloatTitle     { }, -- Title of floating windows.
		NormalNC({ fg = Normal.fg, bg = NormlFloat.bg }), -- normal text in non-current windows
		Pmenu({ NormalFloat }), -- Popup menu: Normal item.
		PmenuSel({ bg = "#3b3a39" }), -- Popup menu: Selected item.
		PmenuKind({ Pmenu }), -- Popup menu: Normal item "kind"
		PmenuKindSel({ bg = "#3b3a39" }), -- Popup menu: Selected item "kind"
		PmenuExtra({ Pmenu }), -- Popup menu: Normal item "extra text"
		PmenuExtraSel({ bg = "#3b3a39" }), -- Popup menu: Selected item "extra text"
		PmenuSbar({ Pmenu }), -- Popup menu: Scrollbar.
		PmenuThumb({ PmenuSel }), -- Popup menu: Thumb of the scrollbar.
		-- Question       { }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search({ CurSearch }), -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		-- StatusLine     { }, -- Status line of current window
		-- StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		-- TabLineSel     { }, -- Tab pages line, active tab page label
		-- Title          { }, -- Titles for output from ":set all", ":autocmd" etc.
		Visual({ bg = "#3b3a39" }), -- Visual mode selection
		WarningMsg({ fg = "#ffd8ae" }), -- Warning messages
		Winseparator({ fg = "#a08264" }), -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- See :h group-name

		Comment({ fg = "#a6a1a1" }), -- Any comment

		Constant({ fg = "#ff9e9e" }), -- (*) Any constant
		String({ fg = "#e8ba98" }), --   A string constant: "this is a string"
		Character({ String }), --   A character constant: 'c', '\n'
		Number({ Constant }), --   A number constant: 234, 0xff
		Boolean({ Constant }), --   A boolean constant: TRUE, false
		Float({ Constant }), --   A floating point constant: 2.3e10

		Identifier({ fg = "#ffd4b4" }), -- (*) Any variable name
		Function({ fg = "#bbffe9" }), --   Function name (also: methods for classes)
		Methods({ Function }),

		Statement({ fg = "#f3c8a9" }), -- (*) Any statement
		-- Conditional    { }, --   if, then, else, endif, switch, etc.
		-- Repeat         { }, --   for, do, while, etc.
		-- Label          { }, --   case, default, etc.
		Operator({ fg = "#ffa08c" }), --   "sizeof", "+", "*", etc.
		Keyword({ fg = "#deade4" }), --   any other keyword
		-- Exception      { }, --   try, catch, throw

		PreProc({ Keyword }), -- (*) Generic Preprocessor
		-- Include        { }, --   Preprocessor #include
		-- Define         { }, --   Preprocessor #define
		-- Macro          { }, --   Same as Define
		-- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

		Type({ fg = "#ffc093" }), -- (*) int, long, char, etc.
		-- StorageClass   { }, --   static, register, volatile, etc.
		-- Structure      { }, --   struct, union, enum, etc.
		-- Typedef        { }, --   A typedef

		Special({ fg = "#ffc8a0" }), -- (*) Any special symbol
		SpecialChar({ Special }), --   Special character in a constant
		Tag({ Function }), --   You can use CTRL-] on this
		Delimiter({ fg = "#ffc8a0" }), --   Character that needs attention

		Underlined({ underline = true }), -- Text that stands out, HTML links

		Error({ fg = "#ff8290" }), -- Any erroneous construct
		Todo({ Comment }), -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Debug({ fg = "#ff8290" }),

		-- See :h lsp-highlight

		-- LspReferenceText            { } , -- Used for highlighting "text" references
		-- LspReferenceRead            { } , -- Used for highlighting "read" references
		-- LspReferenceWrite           { } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights

		DiagnosticError({ ErrorMsg }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn({ fg = "#ffd8ae" }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo({ fg = "#7f91b2" }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint({ fg = "#e7aabd" }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk({ fg = "#6cb6a0" }), -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

		DiagnosticVirtualTextError({ ErrorMsg }), -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn({ DiagnosticWarn }), -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo({ DiagnosticInfo }), -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint({ DiagnosticHint }), -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk({ DiagnosticOk }), -- Used for "Ok" diagnostic virtual text.

		DiagnosticFloatingError({ ErrorMsg }), -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		DiagnosticFloatingWarn({ DiagnosticWarn }), -- Used to color "Warn" diagnostic messages in diagnostics float.
		DiagnosticFloatingInfo({ DiagnosticInfo }), -- Used to color "Info" diagnostic messages in diagnostics float.
		DiagnosticFloatingHint({ DiagnosticHint }), -- Used to color "Hint" diagnostic messages in diagnostics float.
		DiagnosticFloatingOk({ DiagnosticOk }), -- Used to color "Ok" diagnostic messages in diagnostics float.

		DiagnosticSignError({ ErrorMsg }), -- Used for "Error" signs in sign column.
		DiagnosticSignWarn({ DiagnosticWarn }), -- Used for "Warn" signs in sign column.
		DiagnosticSignInfo({ DiagnosticInfo }), -- Used for "Info" signs in sign column.
		DiagnosticSignHint({ DiagnosticHint }), -- Used for "Hint" signs in sign column.
		DiagnosticSignOk({ DiagnosticOk }), -- Used for "Ok" signs in sign column.

		DiagnosticUnnecessary({ Comment }),

		-- Cmp Highlights

		CmpDocumentation = { Normal },
		CmpDocumentationBorder = { Normal },

		CmpItemAbbr = { fg = p.comments },
		CmpItemAbbrDeprecated = { fg = p.ui_accent, italic = true },
		CmpItemAbbrMatch = { fg = p.fg_main },
		CmpItemAbbrMatchFuzzy = { fg = p.fg_main },

		CmpItemKindDefault = { fg = p.fg_main },
		CmpItemMenu = { fg = p.comments },

		CmpItemKindKeyword = { link = "Identifier" },

		CmpItemKindVariable = { link = "@variable" },
		CmpItemKindConstant = { link = "Constant" },
		CmpItemKindReference = { link = "Keyword" },
		CmpItemKindValue = { link = "Keyword" },

		CmpItemKindFunction = { link = "Function" },
		CmpItemKindMethod = { link = "Function" },
		CmpItemKindConstructor = { link = "Function" },

		CmpItemKindInterface = { link = "Constant" },
		CmpItemKindEvent = { link = "Constant" },
		CmpItemKindEnum = { link = "Constant" },
		CmpItemKindUnit = { link = "Constant" },

		CmpItemKindClass = { link = "Type" },
		CmpItemKindStruct = { link = "Type" },

		CmpItemKindModule = { link = "@module" },

		CmpItemKindProperty = { link = "@property" },
		CmpItemKindField = { link = "@field" },
		CmpItemKindTypeParameter = { link = "@field" },
		CmpItemKindEnumMember = { link = "@field" },
		CmpItemKindOperator = { link = "Operator" },
		CmpItemKindSnippet = { fg = p.preproc },

		-- Tree-Sitter syntax groups.
		-- See :h treesitter-highlight-groups

		sym("@comment")({ Comment }),

		sym("@diff.plus")({ DiffAdd }), -- added text (for diff files)
		sym("@diff.minus")({ DiffDelete }), -- deleted text (for diff files)
		sym("@diff.delta")({ DiffChange }), -- changed text (for diff files)

		sym("@variable.parameter")({ fg = Normal.fg }),

		sym("@function")({ Function }), -- Function
		sym("@function.builtin")({ Function }), -- Special
		sym("@function.macro")({ Function }), -- Macro
		sym("@function.method")({ Function }), -- method definitions
		sym("@function.method.call")({ Function }), -- method calls

		sym("@keyword")({ Keyword }), -- Keyword
		sym("@keyword.import")({ PreProc }), -- keywords for including modules (e.g. `import` / `from` in Python)

		sym("@markup.heading")({ Type }),
		sym("@markup.link")({ underline = false }), -- text references, footnotes, citations, etc.
		sym("@markup.link.label")({ PreProc }), -- link, reference descriptions

		sym("@tag")({ Function }),
		sym("@tag.html")({ Keyword }),
		sym("@tag.attribute")({ Keyword }),
		sym("@tag.delimiter")({ Delimiter }),
		sym("@string.css")({ String }),

		sym("@text.diff.add")({ link = "@diff.plus" }),
		sym("@text.diff.delete")({ link = "@diff.minus" }),

		sym("@type")({ Type }),
		sym("@type.builtin")({ Type }),
		sym("@type.definition")({ Type }),
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
