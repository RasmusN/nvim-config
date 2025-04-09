return {
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- automatic setup
        keys = {
            {
                "<leader>nf",
                function() require('neogen').generate() end,
                desc = "Generate annotation (Neogen)"
            },
        },
    }
}
