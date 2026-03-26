return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Terminal flotante" },
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Cerrar terminal" },
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal flotante" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal size=15<cr>", desc = "Terminal horizontal" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical size=80<cr>", desc = "Terminal vertical" },
		{
			"<leader>gg",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit",
					direction = "float",
					float_opts = { border = "rounded" },
					on_open = function(term)
						vim.cmd("startinsert!")
					end,
				})
				lazygit:toggle()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>cc",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local claude = Terminal:new({
					cmd = "claude",
					direction = "float",
					float_opts = { border = "rounded" },
					on_open = function(term)
						vim.cmd("startinsert!")
					end,
				})
				claude:toggle()
			end,
			desc = "Claude Code",
		},
	},
	opts = {
		direction = "float",
		float_opts = {
			border = "rounded",
		},
		highlights = {
			FloatBorder = { link = "FloatBorder" },
		},
	},
}
