local M = {
	diagnostics = {
		Error = "",
		Warn = "",
		Hint = "",
		Info = "",
	},
	git = {
		added = "",
		changed = "",
		deleted = "",
		branch = "󰘬", -- branch
		branch2 = "", -- merge
	},
	dap = {
		Stopped = { "󰁕 ", "DiagnosticSignWarn", "DapStoppedLine" },
		Breakpoint = { " ", "DiagnosticSignInfo" },
		BreakpointCondition = { " ", "DiagnosticSignHint" },
		BreakpointRejected = { " ", "DiagnosticSignError" },
		LogPoint = ".>",
	},
	misc = {
		folder = "",
		folder_outline = "",
		file = "",
		file2 = "",
		file_outline = "󰧮",
		search = "",
	},
}

return M
