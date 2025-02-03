-- lua/plugins/rose-pine.lua
return {
	"rose-pine/neovim",
	lazy = false,
	dark_variant = "main",
	name = "rose-pine",
	config = function()
		vim.cmd("colorscheme rose-pine")
	end
}
