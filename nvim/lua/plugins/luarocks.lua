-- Streamlines the installation of luarocks packages directly within nvim

return {
	"vhyrro/luarocks.nvim",
	priority = 1000, -- very high priority is required, luarocks.nvim should run as the first
	config = true,
}
