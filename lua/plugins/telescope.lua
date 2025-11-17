return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

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
              ["<C-h>"] = actions.move_selection_previous,
              ["<C-l>"] = actions.move_selection_next,
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
