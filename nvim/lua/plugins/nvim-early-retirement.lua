-- Send buffers into early retirement by automatically closing them after X minutes of inactivity.

return {
	"chrisgrieser/nvim-early-retirement",
	config = true,
	event = "VeryLazy",
}
