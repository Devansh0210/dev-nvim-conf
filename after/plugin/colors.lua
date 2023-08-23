function colorme(color)
	color = color or "nord"
	vim.cmd.colorscheme(color);

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

colorme()
