return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.install").compilers = { "zig", "clang" }
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
            
            -- Your existing ASM parser configuration
            require('nvim-treesitter.parsers').get_parser_configs().asm = {
                install_info = {
                    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
            }
            vim.filetype.add({
                extension = {
                    gotmpl = "gotmpl",
                    tmpl = "gotmpl",
                },
            })
            -- Updated Go Template parser configuration
            require('nvim-treesitter.parsers').get_parser_configs().gotmpl = {
                install_info = {
                    url = 'https://github.com/ngalaiko/tree-sitter-go-template.git',
                    files = { 'src/parser.c' },
                    branch = 'master', 
                },
                filetype = "gotmpl",
            }
        end,
    },
    {"rush-rs/tree-sitter-asm"},
    {"ngalaiko/tree-sitter-go-template"}
}
