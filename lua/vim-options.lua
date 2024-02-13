-- Set tab to 4 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.wrap = false       -- No line wrap
vim.opt.incsearch = true   -- Help guides searches
vim.opt.hlsearch = false   -- No highlight on search
vim.opt.scrolloff = 8      -- Keep min distance from bottom/top to cursor
vim.opt.updatetime = 50    -- Fast update time
vim.opt.colorcolumn = "80" -- --> Column

-- Auto refresh externally changed files
-- https://stackoverflow.com/questions/62100785/auto-reload-file-and-in-neovim-and-auto-reload-nerbtree
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

-- Autorun git bash terminal if on windows
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.cmd([[let &shell = '"C:\Program Files\Git\bin\bash.exe"']])
    vim.cmd([[let &shellcmdflag = '-s']])
    vim.cmd("set shellslash")
end

vim.wo.relativenumber = true -- Relative numbers
vim.wo.number = true         -- Show actual line number on current line
vim.g.mapleader = " "

-- Disable leader key from moving forward in normal mode
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })
