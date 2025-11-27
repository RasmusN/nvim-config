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
                ensure_installed = {
                    "lua_ls",
                    "marksman",
                    "ts_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "wgsl_analyzer",
                },
                -- Let us call vim.lsp.enable() ourselves so we don't double-enable.
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Go
            vim.lsp.config("gopls", {
                capabilities = capabilities,
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_markers = { "go.work", "go.mod", ".git" },
                workspace_required = true, -- only start gopls when a workspace is found
            })

            -- WGSL analyzer (use Mason's bin)
            local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
            vim.lsp.config("wgsl_analyzer", {
                cmd = { mason_bin .. "/wgsl-analyzer" },
            })

            -- Marksman (defaults are fine)
            vim.lsp.config("marksman", {})

            -- Lua
            vim.lsp.config("lua_ls", {
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

            -- Pyright
            vim.lsp.config("pyright", {})

            -- C# / OmniSharp
            local omnisharp_path = "/Users/rasmus/Apps/omnisharp-osx-arm64-net6.0/OmniSharp"
            vim.lsp.config("omnisharp", {
                cmd = { omnisharp_path, "--languageserver" },
                autostart = true,
            })

            -- TypeScript / JS
            vim.lsp.config("ts_ls", {})

            -- HTML / CSS via vscode-langservers-extracted from Mason
            local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
            local langservers = mason_packages .. "/html-lsp/node_modules/vscode-langservers-extracted/bin/"
            vim.lsp.config("html", {
                cmd = { "node", langservers .. "vscode-html-language-server", "--stdio" },
            })
            vim.lsp.config("cssls", {
                cmd = { "node", langservers .. "vscode-css-language-server", "--stdio" },
            })

            -- JSON (use nvim-lspconfig defaults)
            vim.lsp.config("jsonls", {})

            -- Actually enable all servers
            for _, server in ipairs({
                "gopls",
                "wgsl_analyzer",
                "marksman",
                "lua_ls",
                "pyright",
                "omnisharp",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
            }) do
                vim.lsp.enable(server)
            end

            -- Keymaps / diagnostics 
            vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>d", vim.diagnostic.open_float, {})
            vim.diagnostic.config({
                virtual_text = false,
            })
        end,
    },
}
