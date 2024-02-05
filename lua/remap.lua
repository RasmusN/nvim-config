-- Move highlighted things up an down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes cursor to stay in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Make yanked text stay after replacing
vim.keymap.set("x", "<leader>p", '"_dP', { noremap = true })

-- Copy to system registry
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Naivagtion
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace whatever word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Default file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.keymap.set({ "n", "o" }, "viÅ", "vi{", { noremap = true })
vim.keymap.set({ "n", "o" }, "viå", "vi[", { noremap = true })
vim.keymap.set({ "n", "o" }, "ciÅ", "ci{", { noremap = true })
vim.keymap.set({ "n", "o" }, "ciå", "ci[", { noremap = true })
vim.keymap.set({ "n", "o" }, "tÅ", "t{", { noremap = true })
vim.keymap.set({ "n", "o" }, "tå", "t[", { noremap = true })
vim.keymap.set({ "n", "o" }, "fÅ", "f{", { noremap = true })
vim.keymap.set({ "n", "o" }, "få", "f[", { noremap = true })

-- This is just to make the command instant, otherwise it will check for other commands
vim.keymap.set({ "n", "o" }, "dd", "dd<CR>", { noremap = true })
vim.keymap.set({ "n", "o" }, "yy", "yy<CR>", { noremap = true })

-- Makes it possible to escape terminal with <Esc>
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
