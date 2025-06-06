if vim.g.vscode then
	return {}
end

return {
	{
		"tribela/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
                    --Which key
					"WhichKey",
					"WhichKeyFloat",
                    "WhichKeyBorder",
					"Normal",
					"NormalNC",
					"NormalFloat", -- <- Asegura transparencia en flotantes como which-key
                    -- Telescope
					"TelescopeNormal",
					"TelescopeBorder",
					"TelescopePromptBorder",
                    -- Nvim tree
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					"NvimTreeEndOfBuffer",
					"NvimTreeVertSplit",
                    -- CMP
                    "CmpItemAbbr",
                    "CmpItemAbbrMatch",
                    "CmpItemAbbrMatchFuzzy",
                    "CmpItemKind",
                    "CmpItemMenu",
                    "Pmenu",
                    "PmenuSel",
                    "PmenuSbar",
                    "PmenuThumb",
                },
				exclude_groups = {},
			})
			vim.cmd("TransparentEnable")

			vim.keymap.set("n", "<leader>td", ":TransparentToggle<CR>", { desc = "Alternar transparencia" })
		end,
	},
}
