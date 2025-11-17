return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            -- extra filetype mappings
            vim.filetype.add({
                extension = {
                    gotmpl = "gotmpl",
                    tmpl   = "gotmpl",
                    wgsl   = "wgsl",
                },
            })

            require("nvim-treesitter.configs").setup({
                -- make sure your needed parsers are installed
                ensure_installed = {
                    "lua", "vim", "vimdoc", "query",
                    "asm", "gotmpl", "wgsl",
                },
                auto_install = true,
                highlight = { enable = true },
                indent    = { enable = true },
            })
        end,
    },
}
