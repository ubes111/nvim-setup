--- TODO: add keymaps to manipulate buffers
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
            sections = { lualine_a = { 'buffers' } }
		})
	end,
}
