-- Move highlighted things up an down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes cursor to stay in center
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

-- Mappings for SE Keyboard layout
vim.keymap.set({ "n", "v", "o" }, "¤", "$", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "-", "/", { noremap = true })
vim.keymap.set({ "n", "v", "o" }, "_", "?", { noremap = true })

-- https://stackoverflow.com/a/77940686/4825835
for _, entry in ipairs({
    { { "l", "c" }, "å", "[" },
    { { "l", "c" }, "¨", "]" },
    { { "l", "c" }, "Å", "{" },
    { { "l", "c" }, "^", "}" },
    { { "o", "v" }, "iå", "i[" },
    { { "o", "v" }, "i¨", "i]" },
    { { "o", "v" }, "iÅ", "i{" },
    { { "o", "v" }, "i^", "i}" },
    { { "o", "v" }, "aå", "a[" },
    { { "o", "v" }, "a¨", "a]" },
    { { "o", "v" }, "aÅ", "a{" },
    { { "o", "v" }, "a^", "a}" },
}) do
    local modes, from, to = unpack(entry)
    vim.keymap.set(modes, from, to, { noremap = true })
end
vim.opt.iminsert = 1

-- Makes it possible to escape terminal with <Esc>
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Toggle last file
vim.keymap.set({ "n", "i" }, "<C-TAB>", "<C-6>", { noremap = true })

-- Fixes the bug where code from clipboard gets increasingly indentation
function PasteClipboard()
    vim.o.paste = true 
    -- Get the cursor position before pasting
    local start_row, start_col = unpack(vim.api.nvim_win_get_cursor(0))
    -- Paste clipboard content
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('"*p', true, false, true), 'x', false)
    vim.o.paste = false

    -- Move the cursor to the end of the pasted content  
    -- Calculate the end row after pasting
    local end_row = start_row + vim.fn.line("'>") - vim.fn.line("'<")
    local last_line = vim.api.nvim_buf_get_lines(0, end_row - 1, end_row, false)[0] or ""
    vim.api.nvim_win_set_cursor(0, {end_row, #last_line})
end
vim.api.nvim_set_keymap('i', '<C-r>+', '<Cmd>lua PasteClipboard()<CR>', { noremap = true, silent = true })

-- Go to next error
vim.keymap.set("n", "<leader>ge", vim.diagnostic.goto_next)

