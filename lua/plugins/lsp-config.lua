return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "marksman", "tsserver", "html", "cssls", "jsonls"},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
            -- Golang LSP 
            -- Manually specifying root pattern is needed for some reason. 
            lspconfig.gopls.setup({
                filetypes = {"go", "gomod", "gowork", "gotmpl"},
                root_dir = function(fname)
                    return lspconfig.util.root_pattern('go.mod', '.git')(fname) or lspconfig.util.path.dirname(fname)
                end,
            })
            lspconfig.marksman.setup({})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.pyright.setup({})
            lspconfig.omnisharp.setup({  
                cmd = { "omnisharp", "--verbose"},
                autostart = true,
            })
            lspconfig.tsserver.setup({
                cmd = {
                    "node",
                    "C:\\Users\\RASMUS~1\\AppData\\Local\\NVIM-D~1\\mason\\packages\\TYPESC~1\\NODE_M~1\\TYPESC~1\\lib\\cli.mjs",
                    "--stdio"
                },
            })
            local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
            local langservers = mason_packages .. "/html-lsp/node_modules/vscode-langservers-extracted/bin/"
            lspconfig.html.setup({
                cmd = { "node", langservers .. "vscode-html-language-server", "--stdio" },
            })

            lspconfig.cssls.setup({
                cmd = { "node", langservers .. "vscode-css-language-server", "--stdio" },
            })
            vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>d", vim.diagnostic.open_float, {})
			vim.diagnostic.config({
				virtual_text = false, -- Turn off inline diagnostics
			})
		end,
	},
}
