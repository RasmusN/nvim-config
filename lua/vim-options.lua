vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.wo.relativenumber = true -- Relative numbers
vim.wo.number = true -- Show actual line number on current line
vim.g.mapleader = " "

-- Disable leader key from moving forward in normal mode
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Mappings for SE Keyboard setup
vim.api.nvim_set_keymap("n", "¤", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "¤", "$", { noremap = true })
vim.api.nvim_set_keymap("o", "¤", "$", { noremap = true })

vim.api.nvim_set_keymap("i", "å", "[", { noremap = true })
vim.api.nvim_set_keymap("o", "å", "[", { noremap = true })
vim.api.nvim_set_keymap("i", "¨", "]", { noremap = true })
vim.api.nvim_set_keymap("o", "¨", "]", { noremap = true })

vim.api.nvim_set_keymap("i", "Å", "{", { noremap = true })
vim.api.nvim_set_keymap("o", "Å", "{", { noremap = true })
vim.api.nvim_set_keymap("i", "^", "}", { noremap = true })
vim.api.nvim_set_keymap("o", "^", "}", { noremap = true })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
