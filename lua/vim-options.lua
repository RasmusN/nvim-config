-- Set tab to 4 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.wrap = false -- No line wrap
vim.opt.incsearch = true -- Help guides searches
vim.opt.hlsearch = false -- No highlight on search
vim.opt.scrolloff = 8 -- Keep min distance from bottom/top to cursor
vim.opt.updatetime = 50 -- Fast update time
vim.opt.colorcolumn = "120" -- --> Column
vim.opt.ignorecase = true -- Ignore case when searching

-- Highlight yanked text
-- https://stackoverflow.com/a/73365602/4825835
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})
-- Auto refresh externally changed files
-- https://unix.stackexchange.com/a/760218
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})

-- Autorun git bash terminal if on windows
if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.cmd([[let &shell = '"C:\Program Files\Git\bin\bash.exe"']])
	vim.cmd([[let &shellcmdflag = '-s']])
	vim.cmd("set shellslash")
end

vim.wo.relativenumber = true -- Relative numbers
vim.wo.number = true -- Show actual line number on current line
vim.g.mapleader = " "

-- Disable leader key from moving forward in normal mode
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
