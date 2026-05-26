local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

-- ============================================================================
-- OPTIONS
-- ============================================================================
local options = {
	laststatus = 3,
	ruler = false, --disable extra numbering
	showmode = false, --not needed due to lualine
	showcmd = false,
	wrap = true, --toggle bound to leader W
	cursorline = true, --highlight line
	scrolloff = 15, -- keep 10 lines above/below cursor
	sidescrolloff = 10, -- keep 10 lines to left/right of cursor

	ttyfast = true, --faster scrolling
	smoothscroll = true,
	title = true, --automatic window titlebar
	
	number = true, --numbering lines
	relativenumber = true, --toggle bound to leader nn
	numberwidth = 4,

	signcolumn = "yes", -- always show a sign column
	showmatch = true, -- highlights matching brackets
	cmdheight = 1, -- single line command line
	pumheight = 10, -- popup menu height
	pumblend = 10, -- popup menu transparency
	winblend = 0, -- floating window transparency
	conceallevel = 2, -- obsidian requirement
	concealcursor = "", -- do not hide cursorline in markup
	synmaxcol = 300, -- syntax highlighting limit
	fillchars = { eob = " " }, -- hide "~" on empty lines

	hidden = true, -- allow hidden buffers
	errorbells = false, -- no error sounds
	backspace = "indent,eol,start", -- better backspace behaviour
	autochdir = false, -- do not autochange directories
	selection = "inclusive", -- include last char in selection
	mouse = "a", -- enable mouse support
	modifiable = true, -- allow buffer modifications

	guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",-- cursor blinking and settings


	backup = false, -- do not create a backup file
	writebackup = false, -- do not write to a backup file
	swapfile = false, -- do not create a swapfile
	undofile = true, -- do create an undo file
	undodir = undodir, -- set the undo directory
	updatetime = 300, -- faster completion
	timeoutlen = 500, -- timeout duration
	ttimeoutlen = 50, -- key code timeout
	autoread = true, -- auto-reload changes if outside of neovim
	autowrite = false, -- do not auto-save


	tabstop = 4, -- tabwidth
	shiftwidth = 4, -- indent width
	softtabstop = 4, -- soft tab stop not tabs on tab/backspace
	expandtab = true, -- use spaces instead of tabs
	smartindent = true, -- smart auto-indent
	ignorecase = true, -- case insensitive search
	smartcase = true, -- case sensitive if uppercase in string
	hlsearch = true, -- highlight search matches
	incsearch = true, -- show matches as you type
	
	foldmethod = "expr",
	foldlevel = 99, --disable folding, lower #s enable
	foldexpr = "v:lua.vim.treesitter.foldexpr()", -- use treesitter for folding

	termguicolors = true,

	ignorecase = true, --ignore case while searching
	smartcase = true, --but do not ignore if caps are used

	conceallevel = 2, --markdown conceal
	concealcursor = "nc",

	splitkeep = 'screen', --stablizie window open/close

	wildmenu = true, -- tab completion
	wildmode = "longest:full,full", -- complete longest common match, full completion list, cycle through with Tab
	redrawtime = 10000, -- increase neovim redraw tolerance
	maxmempattern = 20000, -- increase max memory

}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.diagnostic.config({
	signs = false,
})

