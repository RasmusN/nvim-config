return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
        vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", {})
        vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", {})
        vim.keymap.set("n", "<leader>ga", ":Gitsigns stage_buffer<CR>", {})
    end
}

