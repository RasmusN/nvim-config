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
        require('nvim-treesitter.parsers').get_parser_configs().asm = {
        install_info = {
            url = 'https://github.com/rush-rs/tree-sitter-asm.git',
            files = { 'src/parser.c' },
            branch = 'main',
        },
        }
	end,
    },
    {"rush-rs/tree-sitter-asm"}
}
