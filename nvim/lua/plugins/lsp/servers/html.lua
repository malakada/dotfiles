local M = {}

M.setup = function(capabilities)
	return {
		capabiilties = capabilities,
		filetypes = { "html" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
			provideFormatter = true,
		},
	}
end
