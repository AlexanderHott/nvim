return {
	{
		-- "AlexanderHOtt/keyquest.nvim",
		dir = "~/Documents/code/personal/keyquest.nvim/",
		opts = {
			quests = {
				{ mode = "n", keymap = "<C-^>", amount_goal = 40, amount_curr = 0 },
				{ mode = "n", keymap = "f", amount_goal = 40, amount_curr = 0 },
				{ mode = "n", keymap = "t", amount_goal = 40, amount_curr = 0 },
				{ mode = "n", keymap = "gd", amount_goal = 5, amount_curr = 0 },
			},
		},
		config = function(_, opts)
			local keyquest = require("keyquest")
			keyquest.setup(opts)
			keyquest.toggle()
			vim.keymap.set("n", "<leader>kq", keyquest.toggle, { desc = "Toggle [k]ey[q]uest" })
		end,
	},
}
