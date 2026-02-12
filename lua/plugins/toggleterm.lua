return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = "<C-.>",
		direction = "float",
	},
	keys = {
		{ "<leader>1", "<Cmd>1ToggleTerm direction=float<CR>", mode = { "n", "t" }, desc = "Toggle terminal 1" },
		{ "<leader>2", "<Cmd>2ToggleTerm direction=float<CR>", mode = { "n", "t" }, desc = "Toggle terminal 2" },
		{ "<leader>3", "<Cmd>3ToggleTerm direction=float<CR>", mode = { "n", "t" }, desc = "Toggle terminal 3" },
	},
}
