return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint_config = {
			prefer_local = "node_modules/.bin",
			condition = function(utils)
				return utils.root_has_file({
					".eslintrc",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
				})
			end,
		}
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.sqlfmt,
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
