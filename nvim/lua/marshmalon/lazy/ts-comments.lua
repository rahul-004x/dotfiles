return {
	"folke/ts-comments.nvim",
	event = "VeryLazy",
	enabled = vim.fn.has("nvim-0.10.0") == 1,
	opts = {
		lang = {
			javascript = {
				"// %s", -- single-line comments
				"/* %s */", -- block comments
			},
			typescript = {
				"// %s",
				"/* %s */",
			},
		},
	},
}
