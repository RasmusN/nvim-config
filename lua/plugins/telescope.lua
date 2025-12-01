return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin    = require("telescope.builtin")
            local pickers    = require('telescope.pickers')
            local finders    = require('telescope.finders')
            local previewers = require('telescope.previewers')
            local conf       = require('telescope.config').values

            
            -- Show git diff between head and master
            vim.keymap.set("n", "fd", function()
                local base       = "master"
                local target     = "HEAD"
                -- Always run commands from the repo root
                local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
                if git_root == nil or git_root == "" then
                    vim.notify("Not inside a git repo", vim.log.levels.ERROR)
                    return
                end

                pickers.new({}, {
                    prompt_title = ("Diff files: %s...%s"):format(base, target),

                    finder = finders.new_oneshot_job(
                        { "git", "-C", git_root, "diff", "--name-only", base .. "..." .. target },
                        {
                            entry_maker = function(line)
                                return {
                                    value   = line, -- used by previewer
                                    display = line, -- what you see in the list
                                    ordinal = line, -- what sorting uses
                                }
                            end,
                        }
                    ),

                    sorter = conf.generic_sorter({}),

                    previewer = previewers.new_termopen_previewer({
                        get_command = function(entry)
                            if not entry or not entry.value or entry.value == "" then
                                return { "echo", "No file selected" }
                            end

                            -- --no-pager avoids delta/less/etc messing with output
                            return {
                                "git", "-C", git_root, "--no-pager",
                                "diff", base .. "..." .. target,
                                "--", entry.value,
                            }
                        end,
                    }),
                }):find()
            end, { desc = "Git diff files between branches (with preview)" })

            -- Mappings
            vim.keymap.set("n", "ff", builtin.find_files, {})
            vim.keymap.set("n", "fs", function()
                builtin.live_grep({ additional_args = { "--fixed-strings" } })
            end, {})
            vim.keymap.set("n", "<C-p>", builtin.git_files, {})
            vim.keymap.set("n", "<Leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end)
            vim.keymap.set("n", "<Leader>t", builtin.grep_string, {})
            vim.keymap.set("n", "fc", builtin.current_buffer_fuzzy_find, {})
            -- Visual mode: search selected text
            vim.keymap.set("v", "<Leader>t", function()
                local text = vim.getVisualSelection()
                builtin.grep_string({ search = text })
            end, {})

            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    -- Hide matches from these dirs in file pickers too
                    file_ignore_patterns = { "^venv/", "/venv/", "/cassettes/", "^cassettes/" },

                    -- Send extra args to ripgrep globally (affects grep_string/live_grep/etc.)
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        -- Ignore unwanted folders everywhere
                        "--glob=!venv/*",
                        "--glob=!**/casettes/*",
                    },

                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<c-d>"] = actions.preview_scrolling_down,
                            ["<c-u>"] = actions.preview_scrolling_up,
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            -- This merges with the existing setup above (doesn't overwrite defaults)
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
