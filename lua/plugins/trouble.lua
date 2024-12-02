return {
	{
		"folke/trouble.nvim",
		-- keys = {
		-- 	{
		-- 		"<leader>xx",
		-- 		"<cmd>Trouble diagnostics toggle<cr>",
		-- 		desc = "Diagnostics (Trouble)",
		-- 	},
		-- 	{
		-- 		"<leader>xX",
		-- 		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		-- 		desc = "Buffer Diagnostics (Trouble)",
		-- 	},
		-- 	{
		-- 		"<leader>cs",
		-- 		"<cmd>Trouble symbols toggle focus=false<cr>",
		-- 		desc = "Symbols (Trouble)",
		-- 	},
		-- 	{
		-- 		"<leader>cl",
		-- 		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		-- 		desc = "LSP Definitions / references / ... (Trouble)",
		-- 	},
		-- 	{
		-- 		"<leader>xL",
		-- 		"<cmd>Trouble loclist toggle<cr>",
		-- 		desc = "Location List (Trouble)",
		-- 	},
		-- 	{
		-- 		"<leader>xQ",
		-- 		"<cmd>Trouble qflist toggle<cr>",
		-- 		desc = "Quickfix List (Trouble)",
		-- 	},
		-- },
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		config = function()
			require("trouble").setup({})

			vim.keymap.set("n", "<leader>xx", function()
				require("trouble").toggle({ mode = "diagnostics" })
			end)

			vim.keymap.set("n", "[x", function()
				require("trouble").prev({ skip_groups = true, jump = true, mode = "diagnostics" })
			end)

			vim.keymap.set("n", "]x", function()
				require("trouble").next({ skip_groups = true, jump = true, mode = "diagnostics" })
			end)
		end,
	},
}
