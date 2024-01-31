vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.wo.relativenumber = true -- Relative numbers
vim.wo.number = true -- Show actual line number on current line
vim.g.mapleader = " "

-- Disable leader key from moving forward in normal mode
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true, silent = true })

-- Makes the search light dissapear as soon as we press enter
vim.api.nvim_set_keymap("c", "<CR>", "<CR>:nohlsearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<CR>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Mappings for SE Keyboard setup
vim.keymap.set({ "n", "v", "o" }, "¤", "$", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "-", "/", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "_", "?", { noremap = true })
vim.keymap.set({ "i", "o" }, "å", "[]<left>", { noremap = true })
vim.keymap.set({ "i", "o" }, "¨", "]", { noremap = true })
vim.keymap.set({ "i", "o" }, "Å", "{}<left>", { noremap = true })
vim.keymap.set({ "i", "o" }, "^", "}", { noremap = true })

-- Autoclose
vim.keymap.set({ "i" }, '"', '""<left>', { noremap = true })
vim.keymap.set({ "i" }, "'", "''<left>", { noremap = true })
vim.keymap.set({ "i" }, "(", "()<left>", { noremap = true })

-- Uggly fix for making sure that at least the most common combinations work
-- NOTE: In order for "yiÅ" to map to yi{ it has to be pressed fast, otherwise
-- it will be interpreted as yiÅ. Not intentional but kind of nice.
vim.keymap.set({ "n", "o" }, "yiÅ", "yi{", { noremap = true })
vim.keymap.set({ "n", "o" }, "yiå", "yi[", { noremap = true })

vim.keymap.set({ "n", "o" }, "diÅ", "di{", { noremap = true })
vim.keymap.set({ "n", "o" }, "diå", "di[", { noremap = true })

vim.keymap.set({ "n", "o" }, "tÅ", "t{", { noremap = true })
vim.keymap.set({ "n", "o" }, "tå", "t[", { noremap = true })

vim.keymap.set({ "n", "o" }, "fÅ", "f{", { noremap = true })
vim.keymap.set({ "n", "o" }, "få", "f[", { noremap = true })

-- This is just to make the command instant, otherwise it will check for other commands
vim.keymap.set({ "n", "o" }, "dd", "dd<CR>", { noremap = true })

-- Makes it possible to escape terminal with <Esc>
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
