local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Gets rid of highlights after search
opt.hlsearch = false

-- Ensures that when scrolling up/down, our cursor is
-- at least 8 lines away from top/bottom
opt.scrolloff = 8

opt.timeoutlen = 300

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
-- opt.splitleft = true

-- this-thing is one word. dw will now delete it entirely.
opt.iskeyword:append("-")
