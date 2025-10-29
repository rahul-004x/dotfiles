return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false, -- Show dotfiles (files starting with .)
					hide_gitignored = false, -- Show gitignored files
					hide_hidden = false, -- Show hidden files (Windows)
				},
			},
		})

		-- Function to toggle neo-tree with smart open/close logic
		local function toggle_neotree()
			local manager = require("neo-tree.sources.manager")
			local renderer = require("neo-tree.ui.renderer")
			local state = manager.get_state("filesystem")
			if renderer.window_exists(state) then
				-- If neo-tree is open, close it
				vim.cmd("Neotree close")
			else
				-- If neo-tree is closed, open it
				vim.cmd("Neotree filesystem right")
			end
		end
		-- vim.keymap.set("n", "<C-m>", toggle_neotree, {})
		-- vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
